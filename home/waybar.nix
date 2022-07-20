{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        position = "left";
        modules-left = [ "sway/workspaces" "sway/mode" "wlr/taksbar" ];
        modules-center = [];
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

          "cpu" = { format = "\n{usage}%"; };

          "memory" = { format = "\n{}%"; };

          "battery" = {
            states = {
              warning = 20;
              critical = 10;
            };
            format = "{capacity}%";
            format-discharging = "{capacity}%";
            tooltip = true;
          };

          "tray" = {
            icon-size = 20;
            spacing = 2;
          };

          "clock#time" = {
            interval = 1;
            format = "{:%H\n%M}";
            tooltip = false;
          };

          "clock#date" = {
            # format = " {:%e\n%b}";
            format = "{:%e\n%b}";
            tooltip-format = ''
              <big>{:%Y %B}</big>
              <tt><small>{calendar}</small></tt>'';
          };
        };
      };
    };
  };
}
