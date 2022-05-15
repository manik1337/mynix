{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        position = "top";
        modules-left = [ "sway/workspaces" "sway/mode" "wlr/taksbar" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "temperature" "sway/language" "tray" "cpu" "memory" "battery" "clock" ];

        modules = {
          "cpu" = {
            format = "{usage}% ";
          };

          "memory" = {
            format = "{}% ";
          };

          "battery" = {
            states = {
              warning = 20;
              critical = 10;
            };
            format = "  {icon}  {capacity}%";
            format-discharging = "{icon}  {capacity}%";
            tooltip = true;
          };

          "tray" = {
            icon-size = 20;
            spacing = 8;
          };
        };
      };
    };
  };
}
