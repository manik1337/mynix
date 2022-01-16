{ pkgs, lib, ... }: {
  xsession = {
    enable = true;
    pointerCursor = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 32;
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;

      config = rec {
        modifier = "Mod4";
        bars = [ ];

        window = {
          titlebar = false;
          border = 0;
        };

        gaps = {
          inner = 15;
          outer = 5;
          smartGaps = true;
          smartBorders = "on";
        };

        focus.followMouse = false;

        keybindings = lib.mkOptionDefault {
          "XF86AudioMute" = "exec amixer set Master toggle";
          "XF86AudioLowerVolume" = "exec amixer set Master 5%-";
          "XF86AudioRaiseVolume" = "exec amixer set Master 5%+";
          "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
          "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
          "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
          "${modifier}+b" = "exec ${pkgs.chromium}/bin/chromium";
          "${modifier}+Shift+x" = "exec systemctl suspend";
        };

        startup = [
          {
            command = "exec i3-msg workspace 1";
            always = true;
            notification = false;
          }
          {
            command = "systemctl --user restart polybar.service";
            always = true;
            notification = false;
          }
          {
            command = "${pkgs.feh}/bin/feh --bg-scale ~/wp.jpg";
            always = true;
            notification = false;
          }
        ];
      };
    };
  };
}
