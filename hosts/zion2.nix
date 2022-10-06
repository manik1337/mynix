{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../hardware/ledger.nix
    ../hardware/flipper.nix
  ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.availableKernelModules =
    [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/8f867392-c6df-4b2e-9a4a-0465f69b94ec";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
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
        extraGroups = [
          "wheel"
          "audio"
          "docker"
          "wireshark"
          "networkmanager"
          "plugdev"
          "sway"
        ];
      };
      root.openssh.authorizedKeys.keys =
        [ (builtins.readFile ../secrets/ssh.rsa.pub) ];
    };
  };

  networking = {
    networkmanager.enable = true;
    wg-quick.interfaces = {
      wg0 = {
        address = [ "10.2.1.32/32" ];
        privateKey = "MHJTByIGz357jx7Oqjkm1j4U/MAGzJuUF4nVxzL7t0A=";

        peers = [{
          publicKey = "Yip5NXZngVAK0kyN6BmULElqaaeeUdStWSkbLw9AzRo=";
          allowedIPs = [ "10.2.0.0/16" "10.1.0.0/16" ];
          endpoint = "116.202.196.124:51820";
          persistentKeepalive = 12;
        }];
      };
      wg1 = {
        address = [ "10.0.0.4/24" "fdc9:281f:04d7:9ee9::4/64" ];
        dns = [ "10.0.0.1" "fdc9:281f:04d7:9ee9::1" ];
        privateKey = "+GUbhtj2gbATmJtTbAnN5r0GIQQFbqeyMzVwHANVRm4=";

        peers = [{
          publicKey = "L5f/b9oZJ7ahl/lQjsOfXVR2MJ5EGrM26urDi5Ul/0U=";
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          endpoint = "135.181.145.101:51820";
          persistentKeepalive = 25;
        }];
      };
    };
  };

  swapDevices = [ ];

  security.rtkit.enable = true;
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
      gtkUsePortal = true;
    };
  };

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
          {
            "node.name" = "~bluez_input.*";
          }
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

  hardware.ledger.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };
  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.printing = {
    enable = true;
    drivers = [ pkgs.gutenprint ];
  };

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  system.stateVersion = "21.11";
}
