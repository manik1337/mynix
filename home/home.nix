{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./rofi.nix
    ./compton.nix
    ./git.nix
    ./i3.nix
    ./polybar.nix
    ./redshift.nix
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
    
    emacs    # Emacs 27.2
    ripgrep
    # optional dependencies
    coreutils # basic GNU utilities
    fd
    emacs-all-the-icons-fonts
    # clang
    
    # (import ./emacs.nix { inherit pkgs; })
    vscode
    # sublime3

    jetbrains-mono
    nerdfonts

    # messangers
    discord
    slack

    thunderbird
    
    # browsers
    chromium
    firefox
    # brave

    spotify
    _1password-gui

    # utils
    dmenu
    ncpamixer

    libreoffice
    zathura
    flameshot
    # krita
    # dwarf-fortress

    # 3d printing
    cura
    super-slicer-latest
  ];

  home.sessionVariables = {
    EDITOR   = "emacs";
    BROWSER  = "chromium";
    TERMINAL = "alacritty";
  };

  home.keyboard = {
    layout = "us,ru";
    options = [ "caps:ctrl_modifier,grp:alt_shift_toggle" ];
  };

  programs = {
    chromium = {
      enable = true;
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
        "aapbdbdomjkkjkaonfhkkikfgjllcleb" # translate
        "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
      ];
    };
    gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };
  };

  services = {
    dunst = {
      enable = true;
      iconTheme = {
        name = "Adwaita";
        package = pkgs.gnome3.adwaita-icon-theme;
        size = "16x16";
      };
      settings = {
        global = {
          geometry = "300x25-50+65";
          shrink = "yes";
          transparency = 10;
          padding = 16;
          horizontal_padding = 16;
          font = "JetBrains Mono 10";
          line_height = 2;
          format = "<b>%s</b>\\n%b";
        };
      };
    };
  };
  
  xsession.enable = true;
  programs.home-manager.enable = true;
}
