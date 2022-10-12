{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./rofi.nix
    ./git.nix
    ./redshift.nix
    ./dunst.nix
    ./browser.nix
    ./emacs
    ./zsh.nix
    ./security.nix
    ./vscode.nix
    ./sway.nix
    ./waybar.nix
    ./direnv.nix
    ./nvim
    ./tmux.nix
    ./xdg.nix
    ./mako.nix
    ./zellij.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # elixir
    erlangR24
    erlang-ls
    elixir
    elixir_ls

    # rust
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy

    # haskell
    haskell-language-server

    # go
    go

    # nodejs
    nodejs-16_x
    nodePackages.typescript-language-server

    # ocaml
    ocaml
    opam
    dune_3
    ocamlPackages.merlin
    ocamlPackages.ocaml-lsp
    ocamlPackages.utop
    nodePackages.esy

    # nix
    nixfmt
    rnix-lsp

    terraform

    # etc
    binutils
    pkg-config
    gcc
    gnumake
    ghc
    oh-my-zsh
    git
    git-crypt
    gnupg
    xclip
    ledger-live
    insomnia
    beekeeper-studio

    # editors
    vim

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
    btop
    bat
    fzf
    exa
    wget
    unzip
    openssl
    ranger
    jq
    jless

    libreoffice
    zathura
    flameshot
    krita
    thunderbird-wayland
    vlc
    spotify

    # keyboard
    wally-cli

    pavucontrol
    pulseaudio
    pipewire

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

    obs-studio
    mpd
    ncmpcpp

    lutris
    gitkraken

    google-dot-cursor

    mpv
    
    steam
    qflipper
  ];

  home.file.".icons/default".source = "${pkgs.google-dot-cursor}/share/icons/";

  programs = {
    gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };
  };

  programs.home-manager.enable = true;
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    XDG_CURRENT_DESKTOP = "sway";
  };

  home.stateVersion = "21.11";
}
