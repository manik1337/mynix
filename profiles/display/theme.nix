{ pkgs, lib, ... }:
{
  home-manager.users.dmanik = {
    home.packages = with pkgs.gnomeExtensions; [
      blur-my-shell
      appindicator
    ];

    gtk = {
      enable = true;
      theme = {
        package = pkgs.gnome-themes-extra;
        name = "Adwaita-dark";
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "adwaita";
      style.name = "adwaita";
    };

    dconf = {
      enable = true;
      settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = with pkgs.gnomeExtensions; [
            blur-my-shell.extensionUuid
            appindicator.extensionUuid
          ];
        };
        "org/gnome/desktop/interface".color-scheme = "prefer-dark";
        "org/gnome/desktop/interface".cursor-size = 32;
        # "org/gnome/desktop/interface".monospace-font-name = "DejaVuSansM Nerd Font Mono 12";
        "org/gnome/desktop/wm/preferences".resize-with-right-button = true;
        "org/gnome/desktop/peripherals/keyboard" = {
          repeat-interval = lib.gvariant.mkUint32 15;
          delay = lib.gvariant.mkUint32 250;
        };
        "org/gnome/settings-daemon/plugins/media-keys".screensaver = [ "<Shift><Super>l" ];
        "org/gnome/desktop/wm/keybindings" = {
          switch-to-workspace-1 = [ "<Super>1" ];
          switch-to-workspace-2 = [ "<Super>2" ];
          switch-to-workspace-3 = [ "<Super>3" ];
          switch-to-workspace-4 = [ "<Super>4" ];
          switch-to-workspace-5 = [ "<Super>5" ];
          switch-to-workspace-6 = [ "<Super>6" ];
          move-to-workspace-1 = [ "<Super><Shift>1" ];
          move-to-workspace-2 = [ "<Super><Shift>2" ];
          move-to-workspace-3 = [ "<Super><Shift>3" ];
          move-to-workspace-4 = [ "<Super><Shift>4" ];
          move-to-workspace-5 = [ "<Super><Shift>5" ];
          move-to-workspace-6 = [ "<Super><Shift>6" ];
          show-screenshot-ui = [ "<Super>p" ];
          show-screen-recording-ui = [ "<Super><Shift>p" ];
          toggle-maximized = [ "<Super>f" ];
          close = [ "<Super>q" ];
        };
      };
    };
  };
}
