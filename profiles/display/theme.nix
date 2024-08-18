{ pkgs, ... }: {
  home-manager.users.dmanik = {
    gtk = {
      enable = true;
      iconTheme.name = "Yaru-blue-dark";
      theme.name = "Yaru-blue-dark";
      cursorTheme = {
        package = pkgs.afterglow-cursors-recolored;
        name = "Afterglow-Recolored-Original-Purple";
        size = 24;
      };
    };
    home = {
      file.".icons/default".source = "${pkgs.yaru-theme}/share/icons/Yaru-blue-dark";
      pointerCursor = {
        package = pkgs.afterglow-cursors-recolored;
        name = "Afterglow-Recolored-Original-Purple";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };
      sessionVariables.XCURSOR_SIZE = 24;
    };
  };
}


