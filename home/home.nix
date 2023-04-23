{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./rofi.nix
    ./git.nix
    ./zsh.nix
    ./security.nix
    ./vscode.nix
    ./sway.nix
    ./swaylock.nix
    ./waybar
    ./direnv.nix
    ./nvim
    ./xdg.nix
    ./mako.nix
    ./zellij.nix
    ./chromium.nix
    ./firefox.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    dconf
    erlangR24
    elixir_1_14
    elixir_ls

    # rust
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy

    # scala
    scala
    sbt
    coursier
    metals
    jdk

    # nix
    nixfmt
    rnix-lsp

    python3
    terraform

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
    beekeeper-studio

    # fonts
    nerdfonts

    # messengers
    tdesktop
    kotatogram-desktop
    discord
    slack
    teams

    spotify
    ncspot

    _1password-gui
    bitwarden
    bitwarden-cli

    # utils
    dmenu
    ncpamixer
    htop
    btop
    bat
    fzf
    exa
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

    pkgs.stable.libreoffice
    zathura
    foliate
    flameshot
    krita
    thunderbird-wayland
    vlc
    spotify

    # keyboard
    wally-cli

    # sound
    pavucontrol
    pulseaudio
    pipewire

    # wayland
    brightnessctl
    slurp
    grim
    swaylock
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

    google-dot-cursor

    qflipper
    sof-firmware

    yaru-theme

    jetbrains.idea-community

    steam
    lutris
    vulkan-tools
  ];

  # home.file.".icons/default".source = "${pkgs.google-dot-cursor}/share/icons/";
  home.file.".icons/default".source = "${pkgs.yaru-theme}/share/icons/Yaru";

  gtk = {
    enable = true;
    cursorTheme.name = "Yaru";
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
