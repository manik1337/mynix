{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        position = "top";
        # modules-left = [ "sway/workspaces" "sway/mode" "wlr/taksbar" ];
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ ];
        modules-right = [
          "tray"
          "custom/spotify"
          "custom/disk_root"
          "cpu"
          "memory"
          "battery"
          "clock#time"
          "clock#date"
          "sway/language"
        ];

        modules = {
          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
          };

          "custom/spotify" = {
            exec =
              "/usr/bin/python3 /full/path/to/mediaplayer.py --player spotify";
            max-length = 40;
            format = " {}";
            return-type = "json";
            on-click = "playerctl -p spotify play-pause";
          };

          "custom/disk_root" = {
            format = "DISK {}";
            interval = 30;
            exec = "df -h --output=avail / | tail -1 | tr -d ' '";
          };

          "cpu" = { format = "CPU {usage}%"; };

          "memory" = { format = "RAM {}%"; };

          "battery" = {
            states = {
              warning = 20;
              critical = 10;
            };
            format = "POWER {capacity}%";
            format-discharging = "BAT {capacity}%";
            tooltip = true;
          };

          "tray" = {
            icon-size = 20;
            spacing = 4;
          };

          "clock#time" = {
            interval = 1;
            format = "{:%H:%M}";
            tooltip = false;
          };

          "clock#date" = {
            # format = " {:%e\n%b}";
            format = "{:%e %b}";
            tooltip-format = ''
              <big>{:%Y %B}</big>
              <tt><small>{calendar}</small></tt>'';
          };
        };
      };
    };
  };
}
