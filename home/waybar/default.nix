{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      height = 24;
      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "sway/window" ];
      modules-right = [
        "pulseaudio"
        "cpu"
        "memory"
        "battery"
        "tray"
        "clock"
        "sway/language"
      ];
      "sway/workspaces" = {
        disable-scroll = true;
        all-outputs = false;
        format = "{icon}";
      };
      "sway/mode" = {
        format = " {}";
        max-length = 50;
      };
      "sway/language" = {
        format = "{flag}";
        tooltip = false;
        # max-length = 50;
      };
      "tray" = {
        # icon-size = 21;
        spacing = 10;
      };
      "clock" = {
        format = "{:%d.%m.%Y %a %H:%M}";
        calendar = {
          mode = "year";
          mode-mon-col = 3;
          weeks-pos = "right";
          on-scroll = 1;
          on-click-right = "mode";
          format = { today = "<span color='#ff6699'><b><u>{}</u></b></span>"; };
        };
        tooltip-format = "<tt><small>{calendar}</small></tt>";
        actions = {
          on-click-right = "mode";
          on-click-forward = "tz_up";
          on-click-backward = "tz_down";
          on-scroll-up = "shift_up";
          on-scroll-down = "shift_down";
        };
        # format-alt = "{:%Y-%M-%d}";
      };
      "cpu" = { format = "{usage}%"; };
      "memory" = { format = "{}%"; };
      "battery" = {
        bat = "BAT0";
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% ";
        format-plugged = "{capacity}% ";
        format-icons = [ "" "" "" "" "" ];
      };
      "network" = {
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "{ifname} ";
        format-disconnected = "nolink ⚠";
      };
      "pulseaudio" = {
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon} ";
        format-muted = "";
        format-icons = {
          headphones = "";
          handsfree = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" ];
        };
        on-click = "pavucontrol";
      };
    }];

    style = ./style.css;
  };
}
