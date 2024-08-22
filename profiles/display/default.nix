{ pkgs, inputs, ... }: {
  imports = [
    ./browser
    ./rofi
    ./waybar
    ./alacritty.nix
    ./kitty.nix
    ./gaming.nix
    ./mako.nix
    ./sway.nix
    ./wlsunset.nix
    ./theme.nix
    ./zathura.nix
  ];

  home-manager.users.dmanik = {
    imports = [
      inputs.catppuccin.homeManagerModules.catppuccin
    ];
    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
    home.packages = with pkgs; [
      wireguard-tools
      zed-editor
      gimp
      calibre
      cups
      dconf
      glib

      # etc
      binutils
      pkg-config
      xclip
      ledger-live-desktop
      beekeeper-studio

      # messengers
      tdesktop
      (pkgs.discord.override { withOpenASAR = true; })
      slack

      spotify
      bitwarden
      obsidian

      # utils
      cachix
      pamixer
      ncpamixer
      noti
      nix-index
      overskride

      libreoffice
      zathura
      sioyek
      foliate
      flameshot
      thunderbird
      vlc
      spotify

      # keyboard
      wally-cli

      # sound
      pavucontrol
      # pulseaudio
      pipewire
      wireplumber

      # media
      obs-studio
      mpd
      ncmpcpp
      mpv

      qflipper
      sof-firmware

      catppuccin
      yaru-theme
      apple-cursor
      afterglow-cursors-recolored
    ];
  };
}
