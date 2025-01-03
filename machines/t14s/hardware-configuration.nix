{ config, pkgs, modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      systemd.enable = true;
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usbhid"
        "thunderbolt"
        "nvme"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ "dm-snapshot" ];
      luks.devices = {
        root = {
          device = "/dev/disk/by-uuid/3d5ebc3b-228f-4f7c-bffc-cb9a8f524ae3";
          preLVM = true;
        };
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "btrfs" ];
    kernelModules = [ "kvm-intel" "wl" ];
    extraModulePackages = [ ];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        enableCryptodisk = true;
      };
    };
  };
  nixpkgs.hostPlatform = "x86_64-linux";
  powerManagement.cpuFreqGovernor = "powersave";
  hardware = {
    enableAllFirmware = true;
    cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
    bluetooth.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
      ];
    };
  };

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
}
