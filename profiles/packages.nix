{ pkgs, ... }:
{
  home-manager.users.dmanik = {
    home.packages = with pkgs; [
      tlp
      nixpkgs-fmt
      cachix
      devenv
      ripgrep

      elixir
      erlang

      zig
      zls

      nixd
      nixfmt-rfc-style

      lua-language-server
      python3
      nodejs-slim

      # etc
      binutils
      pkg-config
      gcc
      gnumake
      oh-my-zsh
      zsh-completions
      git
      git-crypt
      lazygit
      gnupg

      # fonts
      nerd-fonts.symbols-only
      nerd-fonts.hack

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
      yazi
      broot
      jq
      jless
      nethogs
      noti
      nix-index
      overskride
    ];
  };
}
