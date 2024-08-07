{ pkgs, ... }: {
  home-manager.users.dmanik.programs.rofi = {
    enable = true;
    theme = ./style.rasi;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    location = "center";
    extraConfig = {
      font = "Hack Nerd Font 12";
      show-icons = true;
      modi = "run,drun,ssh,filebrowser,window";
      # matching = "fuzzy";
    };
  };
}
