{ pkgs, ... }: {
  imports = [
    ./rofi
    ./waybar
    ./alacritty.nix
    ./browser.nix
    ./gaming.nix
    ./mako.nix
    ./sway.nix
    ./wlsunset.nix
  ];

  home-manager.users.dmanik = {
    home.packages = with pkgs; [
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

      yaru-theme
      apple-cursor
    ];
  };
}
