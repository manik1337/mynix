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
    ./waybar.nix
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
    # elixir
    erlangR24
    erlang-ls
    elixir_1_14
    elixir_ls

    # rust
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy

    # scala
    # dotty
    scala
    sbt
    coursier
    metals
    jdk

    # kotlin
    kotlin
    kotlin-language-server
    gradle

    # golang
    go
    gopls

    # nix
    nixfmt
    rnix-lsp

    # js
    nodejs

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
    lazygit
    gnupg
    xclip
    ledger-live
    insomnia
    beekeeper-studio

    # fonts
    nerdfonts
    ibm-plex

    # messengers
    tdesktop
    kotatogram-desktop
    discord
    slack

    spotify
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

    libreoffice
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
    swaykbdd

    # media
    obs-studio
    mpd
    ncmpcpp
    mpv

    google-dot-cursor

    qflipper
    sof-firmware

    obsidian
  ];

  # home.file.".icons/default".source = "${pkgs.google-dot-cursor}/share/icons/";

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
  };

  home.stateVersion = "21.11";
}
