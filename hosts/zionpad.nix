{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
      ../hardware/ledger.nix
      ../hardware/flipper.nix
      ../hardware/ergodox.nix
      ../hardware/dock.nix
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  # boot.initrd.postDeviceCommands = lib.mkBefore ''
  #   echo "restoring blank root..."
  #   mkdir -p /mnt
  #   mount -o subvol=/ /dev/mapper/lvm-root /mnt
  #   echo "deleting /root subvolume..."
  #   btrfs subvolume delete /mnt/root
  #   echo "restoring blank /root subvolume..."
  #   btrfs subvolume snapshot /mnt/root-blank /mnt/root
  #   umount /mnt
  # '';
  boot.kernelModules = [ "kvm-intel" "wl" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/729af431-d657-4feb-92fb-79b5987c23cf";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/729af431-d657-4feb-92fb-79b5987c23cf";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "noatime" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/729af431-d657-4feb-92fb-79b5987c23cf";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-uuid/729af431-d657-4feb-92fb-79b5987c23cf";
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" "noatime" ];
      neededForBoot = true;
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/729af431-d657-4feb-92fb-79b5987c23cf";
      fsType = "btrfs";
      options = [ "subvol=log" "compress=zstd" "noatime" ];
      neededForBoot = true;
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/CA59-C463";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/9bd0932e-9434-4cdd-b9aa-2b7d451792f1"; }
    ];

  sound.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.pipewire.wireplumber.enable = true;
    # media-session.config.bluez-monitor.rules = [
    #   {
    #     # Matches all cards
    #     matches = [{ "device.name" = "~bluez_card.*"; }];
    #     actions = {
    #       "update-props" = {
    #         "bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
    #         # mSBC is not expected to work on all headset + adapter combinations.
    #         "bluez5.msbc-support" = true;
    #         # SBC-XQ is not expected to work on all headset + adapter combinations.
    #         "bluez5.sbc-xq-support" = true;
    #       };
    #     };
    #   }
    # ];
    #   {
    #     matches = [
    #       # Matches all sources
    #       {
    #         "node.name" = "~bluez_input.*";
    #       }
    #       # Matches all outputs
    #       { "node.name" = "~bluez_output.*"; }
    #     ];
    #   }
    # ];



  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  # networking.useDHCP = true;
  # networking.interfaces.wlp0s20f3.useDHCP = true;
  # networking.interfaces.wwp0s20f0u2.useDHCP = true;

  nixpkgs.hostPlatform = "x86_64-linux";
  powerManagement.cpuFreqGovernor = "powersave";
  hardware.cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
  hardware.bluetooth.enable = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      amdvlk
      intel-media-driver
      rocm-opencl-icd
      rocm-opencl-runtime
    ];
  };
 

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "btrfs" ];
  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;
  
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "nodev";
    efiSupport = true;
    enableCryptodisk = true;
  };

  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/3d5ebc3b-228f-4f7c-bffc-cb9a8f524ae3";
      preLVM = true;
    };
  };

  networking = {
    hostName = "zionpad";
    networkmanager.enable = true;
    # useDHCP = false;
    # interfaces.wlp0s20f3.useDHCP = true;
    # interfaces.wwp0s20f0u2.useDHCP = true;
    wg-quick.interfaces = {
      wg0 = {
        address = [ "10.2.1.32/32" ];
        privateKeyFile = "/home/dmanik/.secret/wg0";

        peers = [{
          publicKey = "Yip5NXZngVAK0kyN6BmULElqaaeeUdStWSkbLw9AzRo=";
          allowedIPs = [ "10.2.0.0/16" "10.1.0.0/16" ];
          endpoint = "116.202.196.124:51820";
          persistentKeepalive = 12;
        }];
      };
      # wg1 = {
      #   address = [ "10.0.0.4/24" "fdc9:281f:04d7:9ee9::4/64" ];
      #   dns = [ "10.0.0.1" "fdc9:281f:04d7:9ee9::1" ];
      #   privateKeyFile = "/home/dmanik/.secret/wg1";
      #
      #   peers = [{
      #     publicKey = "L5f/b9oZJ7ahl/lQjsOfXVR2MJ5EGrM26urDi5Ul/0U=";
      #     allowedIPs = [ "0.0.0.0/0" "::/0" ];
      #     endpoint = "135.181.145.101:51820";
      #     persistentKeepalive = 25;
      #   }];
      # };
    };
  };

  users.users = {
    dmanik = {
      isNormalUser = true;
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

  security.pam.services.swaylock.text = "auth include login";

  programs = {
    zsh.enable = true;
    dconf.enable = true;
    nm-applet.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
  };

  time.timeZone = "Europe/Nicosia";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}

