{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./rofi
    ./git.nix
    ./zsh.nix
    ./security.nix
    ./sway.nix
    ./wlsunset.nix
    ./waybar
    ./direnv.nix
    ./nvim
    ./xdg.nix
    ./mako.nix
    ./browser.nix
  ];

  home.packages = with pkgs; [
    devenv

    wine
    winetricks

    awscli2
    calibre
    cups
    dconf
    glib

    elixir
    erlang

    nil

    lua-language-server
    python3
    nodejs-slim

    postgresql

    foundry-bin
    solc

    # etc
    binutils
    pkg-config
    gcc
    gnumake
    ghc
    oh-my-zsh
    zsh-completions
    git
    git-crypt
    gnupg
    xclip
    ledger-live-desktop
    insomnia
    beekeeper-studio

    # fonts
    nerdfonts
    fantasque-sans-mono

    # messengers
    tdesktop
    discord
    slack

    spotify
    ncspot

    _1password-gui
    bitwarden

    obsidian

    # utils
    cachix
    dmenu
    pamixer
    ncpamixer
    htop
    btop
    bat
    fzf
    eza
    wget
    unzip
    unrar
    openssl
    ranger
    broot
    jq
    jless
    nethogs
    gh
    dua
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
    wlroots
    swaykbdd
    wdisplays

    # media
    obs-studio
    mpd
    ncmpcpp
    mpv

    qflipper
    sof-firmware

    yaru-theme
    apple-cursor

    steam
    lutris
    vulkan-tools
  ];

  gtk = {
    enable = true;
    iconTheme.name = "Yaru-blue-dark";
    theme.name = "Yaru-blue-dark";
    cursorTheme = {
      package = pkgs.apple-cursor;
      name = "macOS-BigSur";
      size = 48;
    };
  };

  home.file.".icons/default".source =
    "${pkgs.yaru-theme}/share/icons/Yaru-blue-dark";

  home.pointerCursor = {
    package = pkgs.apple-cursor;
    name = "macOS-BigSur";
    size = 48;
    gtk.enable = true;
    x11.enable = true;
  };

  programs.home-manager.enable = true;

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    XCURSOR_SIZE = 48;
    NIXOS_OZONE_WL = 1;
    XDG_CURRENT_DESKTOP = "sway";
    SDL_VIDEODRIVER = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
  };

  home.stateVersion = "24.05";
}
