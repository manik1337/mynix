{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./rofi.nix
    ./compton.nix
    ./git.nix
    ./redshift.nix
    ./dunst.nix
    ./browser.nix
    ./emacs
    ./zsh.nix
    ./xmonad
    ./security.nix
    ./vscode.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    erlangR24
    erlang-ls

    elixir

    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy

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
    xclip
    ledger-live
    insomnia

    # editors
    vim

    # fonts
    nerdfonts

    # messengers
    tdesktop
    # kotatogram-desktop
    discord
    slack

    spotify
    _1password-gui
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

    libreoffice
    zathura
    flameshot
    krita
    thunderbird

    # 3d printing
    # cura
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
