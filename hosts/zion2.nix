{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/8f867392-c6df-4b2e-9a4a-0465f69b94ec";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/CF25-F198";
      fsType = "vfat";
    };

  sound.enable = true;

  time.timeZone = "Europe/Moscow";

  virtualisation.docker.enable = true;

  users = {
    groups.plugdev = { };
    users = {
      dmanik = {
        isNormalUser = true;
        home = "/home/dmanik";
        shell = pkgs.zsh;
        extraGroups =
          [ "wheel" "audio" "docker" "wireshark" "networkmanager" "plugdev" "sway" ];
      };
      root.openssh.authorizedKeys.keys = [ (builtins.readFile ../secrets/ssh.rsa.pub) ];
    };
  };

  networking = {
    networkmanager.enable = true;
  };

  swapDevices = [ ];

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    media-session.config.bluez-monitor.rules = [
      {
        # Matches all cards
        matches = [{ "device.name" = "~bluez_card.*"; }];
        actions = {
          "update-props" = {
            "bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
            # mSBC is not expected to work on all headset + adapter combinations.
            "bluez5.msbc-support" = true;
            # SBC-XQ is not expected to work on all headset + adapter combinations.
            "bluez5.sbc-xq-support" = true;
          };
        };
      }
      {
        matches = [
          # Matches all sources
          { "node.name" = "~bluez_input.*"; }
          # Matches all outputs
          { "node.name" = "~bluez_output.*"; }
        ];
      }
    ];
  };

  security.pam.services.swaylock = {
    text = ''
        auth include login
    '';
  };

  services.openssh.enable = true;
  #   hardware.pulseaudio.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  system.stateVersion = "21.11";
}
