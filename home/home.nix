{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./rofi.nix
    ./compton.nix
    ./git.nix
    ./redshift.nix
    ./dunst.nix
    ./browser.nix
    ./nvim
    ./emacs
    ./zsh.nix
    ./xmonad
    ./security.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # erlang
    erlangR24
    erlang-ls

    # elixir
    elixir

    # rust
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy

    # nix
    nixfmt
    rnix-lsp

    terraform

    # etc
    cudatoolkit
    gcc
    gnumake
    ghc
    jq
    oh-my-zsh
    git
    git-crypt
    gnupg
    ag
    xclip

    # editors
    vim
    vscode

    # fonts
    nerdfonts

    # messengers
    tdesktop
    kotatogram-desktop
    discord
    slack

    # browsers
    chromium
    firefox

    spotify
    _1password-gui

    # utils
    dmenu
    ncpamixer
    btop
    bat
    fzf
    exa
    wget

    libreoffice
    zathura
    flameshot

    # 3d printing
    cura
    super-slicer-latest

    lutris

    # keyboard
    wally-cli
  ];

  home.keyboard = {
    layout = "us,ru";
    options = [ "caps:ctrl_modifier,grp:alt_shift_toggle" ];
  };

  programs = {
    gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };
  };

  programs.home-manager.enable = true;
}
