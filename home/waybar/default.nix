{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [{
      layer = "top";
      position = "top";
      height = 24;
      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "sway/window" ];
      modules-right = [ "custom/btc" "custom/eth" "pulseaudio" "cpu" "memory" "battery" "tray" "clock" "sway/language" ];

      modules = {
        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
          format = "{icon}";
          # format-icons = {
          #   "1" = "λ";
          #   "2" = "";
          #   "3" = "";
          #   "5" = "";
          #   "8" = "";
          #   "9" = "";
          #   "10" = "♫";
          #   "urgent" = "";
          #   # "focused" = "";
          #   "default" = "";
          # };
        };
        "sway/mode" = {
          format = " {}";
          max-length = 50;
        };
        "sway/language" = {
          format = "{flag}";
          tooltip = false;
          max-length = 50;
        };
        "tray" = {
          # icon-size = 21;
          spacing = 10;
        };
        "clock" = {
          format-alt = "{:%Y-%m-%d}";
        };
        "cpu" = {
          format = "{usage}%";
        };
        "memory" = {
          format = "{}%";
        };
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
      };

      "custom/btc" = {
        format = " {} ";
        interval = 60;
        exec = pkgs.writeShellScript "hello-from-waybar" ''
          ${pkgs.curl}/bin/curl -s https://api.coingecko.com/api/v3/simple/price?ids=bitcoin\&vs_currencies=usd | ${pkgs.jq}/bin/jq -r '.bitcoin.usd'
        '';
      };

      "custom/eth" = {
        format = "⟠ {}";
        interval = 60;

        exec = pkgs.writeShellScript "hello-from-waybar" ''
          ${pkgs.curl}/bin/curl -s https://api.coingecko.com/api/v3/simple/price?ids=ethereum\&vs_currencies=usd | ${pkgs.jq}/bin/jq -r '.ethereum.usd'
        '';
      };
    }];

    style = ./style.css;
  };
}
