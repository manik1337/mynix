{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        position = "top";
        modules-left = [ "sway/workspaces" "sway/mode" "wlr/taksbar" ];
        modules-center = [ "sway/window" ];
        modules-right = [
          "sway/language"
          "tray"
          "temperature#cpu"
          "cpu"
          "memory"
          "battery"
          "clock#time"
          "clock#date"
        ];

        modules = {
          "temperature#cpu" = {
            interval = 1;
            hwmon-path = "/sys/class/hwmon/hwmon2/temp3_input";
            format = " {temperatureC}°C";
            tooltip = false;
          };

          "cpu" = { format = "{usage}% "; };

          "memory" = { format = "{}% "; };

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
          "clock#time" = {
            interval = 1;
            format = "{:%H:%M:%S}";
            tooltip = false;
          };

          "clock#date" = {
            format = " {:%e %b %Y}";
            tooltip-format = ''
              <big>{:%Y %B}</big>
              <tt><small>{calendar}</small></tt>'';
          };
        };
      };
    };
  };
}
