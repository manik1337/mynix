{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./rofi.nix
    ./compton.nix
    ./git.nix
    ./polybar.nix
    ./redshift.nix
    ./emacs.nix
    ./dunst.nix
    ./browser.nix
    ./nvim.nix
    ./dwm.nix
    ./zsh.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    alacritty

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

    # nix
    nixfmt
    rnix-lsp

    # etc
    cudatoolkit
    gcc
    gnumake
    ghc
    jq
    oh-my-zsh
    git
    ag
    neomutt
    calcurse
    xclip

    # editors
    vim
    vscode

    jetbrains-mono
    nerdfonts
    emacs-all-the-icons-fonts

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

    libreoffice
    zathura
    flameshot

    # 3d printing
    cura
    super-slicer-latest
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
