{ pkgs, ... }: {
  home-manager.users.dmanik = {
    gtk = {
      enable = true;
      iconTheme.name = "Yaru-blue-dark";
      theme.name = "Yaru-blue-dark";
      cursorTheme = {
        package = pkgs.apple-cursor;
        name = "macOS-BigSur";
        size = 48;
      };
    };
    home = {
      file.".icons/default".source =

        "${pkgs.yaru-theme}/share/icons/Yaru-blue-dark";

      pointerCursor = {
        package = pkgs.apple-cursor;
        name = "macOS-BigSur";
        size = 48;
        gtk.enable = true;
        x11.enable = true;
      };
      sessionVariables.XCURSOR_SIZE = 48;
    };
  };
}


