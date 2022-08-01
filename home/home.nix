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

    # nix
    nixfmt
    rnix-lsp

    terraform

    # etc
    gcc
    gnumake
    ghc
    jq
    oh-my-zsh
    git
    git-crypt
    gnupg
    xclip
    ledger-live
    insomnia

    # editors
    vim

    # fonts
    nerdfonts
    ibm-plex

    # messengers
    tdesktop
    discord
    slack

    # spotify
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

    libreoffice
    zathura
    flameshot
    krita
    thunderbird
    vlc

    # keyboard
    wally-cli

    pavucontrol
    pulseaudio
    pipewire

    brightnessctl
    slurp
    grim
    mako
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
  ];

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
