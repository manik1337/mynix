{ pkgs, ... }: {
  home-manager.users.dmanik.programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    location = "center";
    extraConfig = {
      # font = "JetBrainsMono Nerd Font 14";
      show-icons = true;
      modi = "run,drun,ssh,filebrowser,window";
    };
  };
}
