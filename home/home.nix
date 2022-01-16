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
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    alacritty
    tdesktop
    kotatogram-desktop

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

    # etc
    cudatoolkit
    nixfmt
    gcc
    gnumake
    ghc
    jq
    oh-my-zsh
    git
    ag

    # editors
    vim
    vscode

    jetbrains-mono
    nerdfonts
    emacs-all-the-icons-fonts

    # messangers
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
    zsh = {
      enable = true;
      enableCompletion = true;
      oh-my-zsh = {
        enable = true;
        theme = "lambda";
        plugins = [ "git" "sudo" ];
      };
    };
  };

  programs.home-manager.enable = true;
}
