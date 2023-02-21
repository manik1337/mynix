{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    style = ./style.css;
    systemd.enable = true;
    settings = {
      mainBar = {
        position = "left";
        modules-left = [ "sway/workspaces"];
        modules-center = [ ];
        modules-right = [
          "cpu"
          "memory"
          "clock"
          "battery"
          "sway/language"
          "tray"
        ];

        modules = {
          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
          };

          "cpu" = { format = " {usage}%"; };

          "memory" = { format = " {}%"; };

          "battery" = {
            interval = 60;
            states = {
              warning = 20;
              critical = 10;
            };
            format = "{capacity}{icon}";
            format-charging = "{capacity}% ";
            format-plugged = "{capacity}% ";
            format-alt = "{time} {icon}";
            format-icons = ["" "" "" "" ""];
            tooltip = true;
          };

          "tray" = {
            spacing = 0;
          };

          "clock" = {
              format = "{:%R}";
              tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
              format-alt = "{:%Y-%m-%d}";
          };
        };
      };
    };
  };
}
