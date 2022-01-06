{ config, lib, pkgs, modulesPath, inputs, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/7b76eed5-0786-4304-901b-f8a34d9bfb96";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/6576-E665";
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
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
      };
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
      libinput.enable = true;
      videoDrivers = [ "nvidia" ];
      displayManager = {
        lightdm.enable = true;
        defaultSession = "none+fake";
        session = let
          fakeSession = {
            manage = "window";
            name = "fake";
            start = "";
          };
        in [ fakeSession ];
      };
    };
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

  # Docker
  virtualisation.docker.enable = true;

  users.users.dmanik = {
    isNormalUser = true;
    home = "/home/dmanik";
    shell = pkgs.zsh;
    extraGroups =
      [ "wheel" "audio" "docker" "wireshark" "networkmanager" "plugdev" ];
  };

  fonts.fonts = with pkgs; [ jetbrains-mono nerdfonts hack-font ];

  programs = {
    nm-applet.enable = true;
    steam.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      ohMyZsh = {
        theme = "lambda";
        enable = true;
        plugins = [ "git" "sudo" ];
      };
    };
  };

  system.stateVersion = "20.09";
}
