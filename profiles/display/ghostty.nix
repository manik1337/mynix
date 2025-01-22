{ ... }:
{
  home-manager.users.dmanik = {
    programs.ghostty = {
      enable = true;
      settings = {
        font-size = 10;
        theme = "light:Adwaita,dark:Adwaita Dark";
        window-theme = "ghostty";
        window-decoration = false;
      };
    };
  };
}
