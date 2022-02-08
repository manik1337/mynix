{ config, lib, pkgs, modulesPath, inputs, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/afe999a3-229e-4923-bc74-843572991548";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/8F93-3EE5";
      fsType = "vfat";
    };

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-amd" ];
    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [ "hid_apple.fnmode=2" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
   };
  };

  swapDevices = [ ];

  time.timeZone = "Europe/Moscow";

  networking = {
    networkmanager.enable = true;
    useDHCP = false;
    interfaces.enp7s0.useDHCP = true;
  };

  services = {
    xserver = {
      enable = true;
      xrandrHeads = [
        {
          output = "DP-0";
          primary = true;
        }
        {
          output = "HDMI-0";
          monitorConfig = "Option \"RightOf\" \"DP-0\"";
        }
      ];
      libinput.enable = true;
      videoDrivers = [ "nvidia" ];
      displayManager = {
        lightdm.enable = true;
        defaultSession = "none+xmonad";
      };
      windowManager.xmonad.enable = true;
      # windowManager.dwm.enable = true;
    };
    openssh.enable = true;
  };

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    video.hidpi.enable = lib.mkDefault true;
    nvidia = {
      powerManagement = {
        enable = false;
        finegrained = false;
      };
    };
    pulseaudio.enable = true;
    keyboard.zsa.enable = true;
  };

  sound.enable = true;

  virtualisation.docker.enable = true;

  users.users = {
    dmanik = {
      isNormalUser = true;
      home = "/home/dmanik";
      shell = pkgs.zsh;
      extraGroups =
        [ "wheel" "audio" "docker" "wireshark" "networkmanager" "plugdev" ];
    };
    root.openssh.authorizedKeys.keys = [ (builtins.readFile ../secrets/ssh.rsa.pub) ];
  };

  fonts.fonts = with pkgs; [ jetbrains-mono nerdfonts hack-font ];

  programs = {
    nm-applet.enable = true;
    steam.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
  };

  system.stateVersion = "21.11";
}
