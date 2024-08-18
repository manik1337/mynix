{ pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    inputs.self.nixosRoles.desktop
    ../../hardware/ledger.nix
    ../../hardware/flipper.nix
    ../../hardware/ergodox.nix
    ../../hardware/dock.nix
  ];
  environment.variables.XCURSOR_SIZE = "24";

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

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
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

  networking = {
    hostName = "zionpad";
    networkmanager.enable = true;
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
      [ (builtins.readFile ../../secrets/ssh.rsa.pub) ];
  };

  security.pam.services.swaylock.text = "auth include login";

  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "dmanik" ];
      experimental-features = [ "nix-command flakes" ];
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
