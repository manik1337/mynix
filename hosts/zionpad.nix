{ config, pkgs, modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../hardware/ledger.nix
    ../hardware/flipper.nix
    ../hardware/ergodox.nix
    ../hardware/dock.nix
  ];

  environment.variables.XCURSOR_SIZE = "48";

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "usbhid"
    "thunderbolt"
    "nvme"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" "wl" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/729af431-d657-4feb-92fb-79b5987c23cf";
    fsType = "btrfs";
    options = [ "subvol=root" "compress=zstd" "noatime" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/729af431-d657-4feb-92fb-79b5987c23cf";
    fsType = "btrfs";
    options = [ "subvol=home" "compress=zstd" "noatime" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/729af431-d657-4feb-92fb-79b5987c23cf";
    fsType = "btrfs";
    options = [ "subvol=nix" "compress=zstd" "noatime" ];
  };

  fileSystems."/persist" = {
    device = "/dev/disk/by-uuid/729af431-d657-4feb-92fb-79b5987c23cf";
    fsType = "btrfs";
    options = [ "subvol=persist" "compress=zstd" "noatime" ];
    neededForBoot = true;
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/729af431-d657-4feb-92fb-79b5987c23cf";
    fsType = "btrfs";
    options = [ "subvol=log" "compress=zstd" "noatime" ];
    neededForBoot = true;
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/CA59-C463";
    fsType = "vfat";
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/9bd0932e-9434-4cdd-b9aa-2b7d451792f1"; }];

  sound.enable = true;

  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
      config.common.default = "*";
    };
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.gutenprint ];
  };

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    wireplumber.enable = true;
  };

  nixpkgs.hostPlatform = "x86_64-linux";
  powerManagement.cpuFreqGovernor = "powersave";
  hardware = {
    enableAllFirmware = true;
    cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
    bluetooth.enable = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
        intel-media-driver
        rocmPackages.clr
        rocmPackages.clr.icd
      ];
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "btrfs" ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
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
    wg-quick.interfaces = {
      # wg0 = {
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

  virtualisation.docker.enable = true;

  users.users = {
    dmanik = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "audio"
        "video"
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

  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "dmanik" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
  };

  programs = {
    zsh.enable = true;
    dconf.enable = true;
    nm-applet.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };
  };

  fonts = {
    enableDefaultPackages = true;
    fontconfig.defaultFonts.monospace = [ "Hack Nerd Font" ];
  };

  time.timeZone = "Europe/Berlin";

  system.stateVersion = "24.05";
}

