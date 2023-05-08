{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = ./style.css;
    systemd.enable = true;
    settings = {
      mainBar = {
        position = "top";
        modules-left = [ "sway/workspaces"];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "custom/separator"
          "cpu"
          "custom/separator"
          "memory"
          "custom/separator"
          "backlight"
          "custom/separator"
          "pulseaudio"
          "custom/separator"
          "network"
          "custom/separator"
          "battery"
          "custom/separator"
          "sway/language"
        ];

        modules = {
          "sway/workspaces" = {
            disable-scroll = true;
          };

          "cpu" = {
            format = " {usage}%";
          };

          "memory" = {
            format = " {}%";
          };

          "battery" = {
            interval = 60;
            states = {
              good = 95;
              warning = 30;
              critical = 15;
            };
            format = "{icon}  {capacity}%";
            format-charging = " {capacity}%";
            format-plugged = " {capacity}%";
            format-alt = "{icon}  {time}";
            format-icons = ["" "" "" "" ""];
            tooltip = true;
          };

          "tray" = {
            spacing = 10;
          };

          "clock" = {
            format = "{:%H:%M %A, %B %d, %Y}  ";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            # calendar = {
            #   mode = "year";
            #   mode-mon-col = 3;
            #   weeks-pos = "right";
            #   on-scroll = 1;
            #   on-click-right = "mode";
            #   format = {
            #     months = "<span color='#ffead3'><b>{}</b></span>";
            #     days = "<span color='#ecc6d9'><b>{}</b></span>";
            #     weeks = "<span color='#99ffdd'><b>W{}</b></span>";
            #     weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            #     today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            #   };
            # };
            # actions = {
            #   on-click-right = "mode";
            #   on-click-forward = "tz_up";
            #   on-click-backward = "tz_down";
            #   on-scroll-up = "shift_up";
            #   on-scroll-down = "shift_down";
            # };
          };

          "network" = {
            format-wifi = "  {essid}";
		        format-ethernet = "  Connected";
		        format-disconnected = " Disconnected";
		        tooltip-format-wifi = " {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\n⬆️ {bandwidthUpBits} ⬇️ {bandwidthDownBits}";
		        tooltip-format-ethernet = " {ifname}\nIP: {ipaddr}\n⬆️ {bandwidthUpBits} ⬇️ {bandwidthDownBits}";
		        format-linked = "{ifname} (No IP) ";
          };

          "pulseaudio" = {
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}%  {format_source}";
            format-bluetooth-muted = "   {format_source}";
            format-muted = " {format_source}";
            format-source = "{volume}%  ";
            format-source-muted = "  ";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
            };
            # on-click = "pavucontrol";
          };

          "custom/separator" = {
            format = " | ";
          };

          "backlight" = {
            format = "{icon} {percent}%";
            format-icons = ["" "" "" "" "" "" "" ""];
          };
        };
      };
    };
  };
}
