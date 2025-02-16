{ pkgs, ... }:
{
  imports = [
    ./browser
    ./rofi
    ./waybar
    ./alacritty.nix
    ./gaming.nix
    ./mako.nix
    ./sway.nix
    ./zathura.nix
    ./ghostty.nix
    ./wlsunset.nix
  ];

  home-manager.users.dmanik = {
    home.packages = with pkgs; [
      todoist-electron
      wireguard-tools
      gimp
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
      telegram-desktop
      (pkgs.discord.override { withOpenASAR = true; })
      slack

      bitwarden-desktop
      obsidian

      # utils
      pamixer
      ncpamixer
      noti
      nix-index
      # overskride

      libreoffice
      zathura
      sioyek
      foliate
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

      qFlipper
      sof-firmware

      teamspeak5_client

      # wayland
      brightnessctl
      slurp
      grim
      swappy
      swaylock-effects
      swayidle
      wl-clipboard
      kanshi
      bemenu
      wf-recorder
      xdg-desktop-portal-wlr
      swaykbdd
      wdisplays
    ];
  };
}
