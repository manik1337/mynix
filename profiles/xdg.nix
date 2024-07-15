{
  home-manager.users.dmanik.xdg = {
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
    dataFile."applications/mimeapps.list".force = true;
    configFile."mimeapps.list".force = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "*/*" = [ "nvim.desktop" ];
        "text/*" = [ "nvim.desktop" ];
        "text/plain" = [ "nvim.desktop" ];
        "text/x-*" = [ "nvim.desktop" ];
        "text/html" = [ "chromium.desktop" "nvim.desktop" ];

        "x-scheme-handler/http" = "chromium.desktop";
        "x-scheme-handler/https" = "chromium.desktop";
        "x-scheme-handler/ftp" = "chromium.desktop";
        "x-scheme-handler/chrome" = "chromium.desktop";

        "application/x-extension-htm" = "chromium.desktop";
        "application/x-extension-html" = "chromium.desktop";
        "application/x-extension-shtml" = "chromium.desktop";
        "application/xhtml+xml" = "chromium.desktop";
        "application/x-extension-xhtml" = "chromium.desktop";
        "application/x-extension-xht" = "chromium.desktop";

        "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
      };
    };
  };
}
