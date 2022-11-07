{ pkgs, ... }: {
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "$HOME/ws";
      documents = "$HOME/media/doc";
      download = "$HOME/dl";
      music = "$HOME/media/music";
      pictures = "$HOME/media/pic";
      templates = "$HOME/ws";
      videos = "$HOME/media/videos";
    };
    systemDirs = {
      data = [ "$HOME/.local/share" ];
      config = [ "$HOME/.config" ];
    };
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "*/*"        = [ "nvim.desktop" ];
        "text/*"     = [ "nvim.desktop" ];
        "text/plain" = [ "nvim.desktop" ];
        "text/x-*"   = [ "nvim.desktop" ];
        "text/html"  = [ "firefox.desktop" "nvim.desktop" ];
     
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/ftp" = "firefox.desktop";
        "x-scheme-handler/chrome" = "firefox.desktop";

        "application/x-extension-htm" = "firefox.desktop";
        "application/x-extension-html" = "firefox.desktop";
        "application/x-extension-shtml" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "application/x-extension-xhtml" = "firefox.desktop";
        "application/x-extension-xht" = "firefox.desktop";

        "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
      };
    };
  };
}
