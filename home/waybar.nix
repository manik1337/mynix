{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        position = "bottom";
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
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: Hack;
        font-size: 13px;
        min-height: 0;
      }
      window#waybar {
        background: transparent;
        color: white;
      }
      #window {
        font-weight: bold;
      }
      #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: white;
        border-top: 2px solid transparent;
      }
      #workspaces button.focused {
        color: #c9545d;
        border-top: 2px solid #c9545d;
      }
      #mode {
        background: #64727D;
        border-bottom: 3px solid white;
      }
      #clock, #battery, #cpu, #memory, #network, #pulseaudio, #custom-spotify, #tray, #mode {
        padding: 0 3px;
        margin: 0 2px;
      }
      #clock {
        font-weight: bold;
      }
      #battery {
      }
      #battery icon {
        color: red;
      }
      #battery.charging {
      }
      @keyframes blink {
        to {
          background-color: #ffffff;
          color: black;
        }
      }
      #battery.warning:not(.charging) {
        color: white;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      #cpu {
      }
      #memory {
      }
      #tray {
      }
    '';
  };
}
