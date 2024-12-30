{ pkgs, ... }: {
  home-manager.users.dmanik = {
    gtk = {
      enable = true;
      iconTheme.name = "Yaru-blue-dark";
      theme.name = "Yaru-blue-dark";
      # cursorTheme = {
      #   package = pkgs.afterglow-cursors-recolored;
      #   name = "Afterglow-Recolored-Catppuccin-Rosewater";
      #   size = 18;
      # };
    };
    home = {
      file.".icons/default".source = "${pkgs.yaru-theme}/share/icons/Yaru-blue-dark";
      # pointerCursor = {
      #   package = pkgs.afterglow-cursors-recolored;
      #   name = "Afterglow-Recolored-Catppuccin-Rosewater";
      #   size = 18;
      #   gtk.enable = true;
      #   x11.enable = true;
      # };
      # sessionVariables.XCURSOR_SIZE = 18;
    };
  };
}


