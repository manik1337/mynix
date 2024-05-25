{ pkgs, ... }: {
  home-manager.users.dmanik = {
    home.packages = with pkgs; [
      nixpkgs-fmt
      devenv
      ripgrep

      wine
      winetricks

      awscli2

      elixir
      erlang

      nil

      lua-language-server
      python3
      nodejs-slim

      postgresql

      # etc
      gcc
      gnumake
      ghc
      oh-my-zsh
      zsh-completions
      git
      git-crypt
      gnupg

      # fonts
      nerdfonts
      fantasque-sans-mono

      # utils
      cachix
      dmenu
      pamixer
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
      broot
      jq
      jless
      nethogs
      gh
      dua
      noti
      nix-index
      overskride

      # keyboard
      wally-cli

      steam
      lutris
      vulkan-tools
    ];
  };
}
