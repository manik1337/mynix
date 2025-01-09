{ ... }:
{
  home-manager.users.dmanik = {
    programs.ghostty = {
      enable = true;
      settings = {
        # font-family = "DejaVuSansM Nerd Font Mono";
        font-size = 12;
        theme = "Adwaita Dark";
      };
    };
  };
}
