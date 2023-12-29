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
    ./zellij.nix
    ./chromium.nix
    ./firefox.nix
    ./tmux
    ./mangohud.nix
    ./vscode.nix
    ./syncthing.nix
  ];

  home.packages = with pkgs; [
    awscli2
    calibre
    godot_4
    pixelorama
    cups
    dconf
    glib

    elixir
    erlang

    # nix
    nixfmt
    rnix-lsp
    nil

    lua-language-server
    python3
    nodejs-slim

    postgresql

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
    ledger-live
    insomnia
    pkgs.stable.beekeeper-studio

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

    pkgs.stable.obsidian

    # utils
    cachix
    dmenu
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
    jq
    jless
    nethogs
    gh
    dua
    noti
    nix-index

    libreoffice
    zathura
    sioyek
    foliate
    flameshot
    krita
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

    # media
    obs-studio
    mpd
    ncmpcpp
    mpv
    crow-translate


    qflipper
    sof-firmware

    yaru-theme

    steam
    lutris
    vulkan-tools
  ];

  gtk = {
    enable = true;
    iconTheme.name = "Yaru-blue-dark";
    theme.name = "Yaru-blue-dark";
  };

  programs = {
    gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };
  };

  programs.home-manager.enable = true;

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    NIXOS_OZONE_WL = 1;
    XDG_CURRENT_DESKTOP = "sway";
    SDL_VIDEODRIVER = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
  };

  home.stateVersion = "21.11";
}
