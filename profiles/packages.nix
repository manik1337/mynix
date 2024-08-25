{ pkgs, ... }: {
  home-manager.users.dmanik = {
    home.packages = with pkgs; [
      nixpkgs-fmt
      devenv
      ripgrep

      wine
      winetricks

      awscli2
      calibre
      cups
      dconf
      glib

      elixir
      erlang

      zig
      zls

      nixd
      nixfmt-rfc-style

      lua-language-server
      python3
      nodejs-slim

      postgresql

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
      ledger-live-desktop
      insomnia
      beekeeper-studio

      # fonts
      nerdfonts
      fantasque-sans-mono

      # messengers
      tdesktop
      (pkgs.discord.override { withOpenASAR = true; })
      slack

      spotify
      ncspot

      _1password-gui
      bitwarden

      obsidian

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
      gh
      dua
      noti
      nix-index
      overskride

      libreoffice
      sioyek
      foliate
      flameshot
      thunderbird
      vlc
      spotify

      # keyboard
      wally-cli

      # sound
      pavucontrol
      # pulseaudio
      pipewire
      wireplumber

      # wayland
      brightnessctl
      slurp
      grim
      swappy
      swaylock-effects
      swayidle
      wl-clipboard
      kanshi
      bemenu
      wf-recorder
      xdg-desktop-portal-wlr
      wlroots
      swaykbdd
      wdisplays

      # media
      obs-studio
      mpd
      ncmpcpp
      mpv

      qflipper
      sof-firmware

      yaru-theme
      apple-cursor
      afterglow-cursors-recolored

      steam
      lutris
      vulkan-tools
    ];
  };
}
