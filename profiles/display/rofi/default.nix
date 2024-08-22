{ pkgs, ... }: {
  home-manager.users.dmanik.programs.rofi = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty}/bin/kitty";
    location = "center";
    extraConfig = {
      font = "JetBrainsMono Nerd Font 14";
      show-icons = true;
      modi = "run,drun,ssh,filebrowser,window";
    };
  };
}
