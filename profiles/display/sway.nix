{ pkgs, ... }:
let
  ws_code = "1";
  ws_terminal = "2";
  ws_browser = "3";
  ws_msg = "4";
  ws5 = "5";
  ws6 = "6";
  ws7 = "7";
  ws8 = "8";
  ws9 = "9";
  ws10 = "10";
  lockCmd = ''
    ${pkgs.swaylock-effects}/bin/swaylock -f \
    --screenshots \
    --effect-blur 5x5 \
  '';
in
{
  home-manager.users.dmanik = {
    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraConfig = ''
        exec swaykbdd
        set $laptop eDP-1
        bindswitch --reload --locked lid:on output $laptop disable
        bindswitch --reload --locked lid:off output $laptop enable
      '';
      config = {
        terminal = "${pkgs.ghostty}/bin/ghostty";
        modifier = "Mod4";
        fonts = {
          names = [ "Hack" ];
          # size = 12.0;
        };
        # colors = {
        #   focused = {
        #     background = "$base";
        #     # border = "$lavender";
        #     border = "$pink";
        #     text = "$text";
        #     indicator = "$rosewater";
        #     # childBorder = "$lavender";
        #     childBorder = "$pink";
        #   };
        #   focusedInactive = {
        #     background = "$base";
        #     border = "$overlay0";
        #     text = "$text";
        #     indicator = "$rosewater";
        #     childBorder = "$overlay0";
        #   };
        #   unfocused = {
        #     background = "$base";
        #     border = "$overlay0";
        #     text = "$text";
        #     indicator = "$rosewater";
        #     childBorder = "$overlay0";
        #   };
        #   urgent = {
        #     background = "$base";
        #     border = "$peach";
        #     text = "$peach";
        #     indicator = "$overlay0";
        #     childBorder = "$peach";
        #   };
        #   placeholder = {
        #     background = "$base";
        #     border = "$overlay0";
        #     text = "$text";
        #     indicator = "$overlay0";
        #     childBorder = "$overlay0";
        #   };
        #   background = "$base";
        # };
        focus = {
          followMouse = "no";
          mouseWarping = false;
        };
        bars = [ { command = "${pkgs.waybar}/bin/waybar"; } ];
        startup = map (cmd: { command = cmd; }) [
          "${pkgs.mako}/bin/mako"
          ''
            ${pkgs.swayidle}/bin/swayidle -w \
            timeout 600 ${lockCmd} \
            timeout 1200 'swaymsg "output * dpms off"' \
            resume 'swaymsg "output * dpms on"' \
            before-sleep ${lockCmd}
          ''
          "${pkgs.telegram-desktop}/bin/telegram-desktop"
          # "${pkgs.firefox}/bin/chromium"
        ];
        input = {
          "type:keyboard" = {
            xkb_layout = "us,ru";
            xkb_options = "grp:alt_shift_toggle,ctrl:nocaps";
            repeat_delay = "250";
            repeat_rate = "50";
          };
          "type:touchpad" = {
            tap = "enabled";
            scroll_factor = "0.5";
          };
          "type:pointer" = {
            accel_profile = "flat";
            pointer_accel = "0";
            scroll_method = "on_button_down";
            scroll_button = "274";
          };
        };
        # output = {
        #   "*" = {
        #     bg = "${./wallpapers/9.jpg} fill";
        #   };
        # };
        bindkeysToCode = true;
        keybindings =
          let
            mod = "Mod4";
            terminal = "ghostty";
          in
          {
            "${mod}+s" = "exec ${pkgs.rofi}/bin/rofi -show run";
            "${mod}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";
            "${mod}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show ssh";
            "${mod}+Return" = "exec ${terminal}";
            "${mod}+Shift+Return" = "exec ${terminal} --class floating_terminal";
            "${mod}+t" = "exec ${terminal} --class floating_terminal -e vim $HOME/ws/todo.norg";
            "${mod}+Shift+t" = "exec ${terminal} --class floating_terminal --working-directory $HOME/ws/mynix/";
            "${mod}+q" = "kill";

            "${mod}+h" = "focus left";
            "${mod}+j" = "focus down";
            "${mod}+k" = "focus up";
            "${mod}+l" = "focus right";

            "${mod}+Shift+Left" = "move left";
            "${mod}+Shift+Down" = "move down";
            "${mod}+Shift+Up" = "move up";
            "${mod}+Shift+Right" = "move right";

            "${mod}+Shift+Space" = "floating toggle";
            "${mod}+Space" = "focus mode_toggle";

            "${mod}+1" = "workspace ${ws_code}";
            "${mod}+2" = "workspace ${ws_terminal}";
            "${mod}+3" = "workspace ${ws_browser}";
            "${mod}+4" = "workspace ${ws_msg}";
            "${mod}+5" = "workspace ${ws5}";
            "${mod}+6" = "workspace ${ws6}";
            "${mod}+7" = "workspace ${ws7}";
            "${mod}+8" = "workspace ${ws8}";
            "${mod}+9" = "workspace ${ws9}";
            "${mod}+0" = "workspace ${ws10}";

            "${mod}+Shift+1" = "move container to workspace ${ws_code}";
            "${mod}+Shift+2" = "move container to workspace ${ws_terminal}";
            "${mod}+Shift+3" = "move container to workspace ${ws_browser}";
            "${mod}+Shift+4" = "move container to workspace ${ws_msg}";
            "${mod}+Shift+5" = "move container to workspace ${ws5}";
            "${mod}+Shift+6" = "move container to workspace ${ws6}";
            "${mod}+Shift+7" = "move container to workspace ${ws7}";
            "${mod}+Shift+8" = "move container to workspace ${ws8}";
            "${mod}+Shift+9" = "move container to workspace ${ws9}";
            "${mod}+Shift+0" = "move container to workspace ${ws10}";

            # "${mod}+h" = "split h";
            "${mod}+v" = "split v";
            "${mod}+f" = "fullscreen toggle";
            "${mod}+comma" = "layout stacking";
            "${mod}+period" = "layout tabbed";
            "${mod}+slash" = "layout toggle split";
            # "${mod}+a" = "focus parent";
            # "${mod}+s" = "focus child";
            "${mod}+Shift+s" = "sticky toggle";

            "${mod}+Shift+c" = "reload";
            "${mod}+Shift+r" = "restart";
            "${mod}+Shift+v" = ''mode "system:  [r]eboot  [p]oweroff  [l]ogout"'';

            "${mod}+r" = "mode resize";

            "${mod}+p" = "exec ${pkgs.slurp}/bin/slurp | ${pkgs.grim}/bin/grim -g - - | wl-copy -t image/png";
            "${mod}+Shift+p" =
              "exec ${pkgs.slurp}/bin/slurp | ${pkgs.grim}/bin/grim -g- ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png";

            "${mod}+Shift+l" = "exec ${lockCmd}";
            # "${mod}+Shift+k" = "exec ${pkgs.mako}/bin/makoctl invoke";
            "${mod}+Shift+k" = "exec ${pkgs.mako}/bin/makoctl dismiss -a";

            "XF86AudioMute" = "exec --no-startup-id pamixer -t";
            "XF86AudioRaiseVolume" = "exec --no-startup-id pamixer -i 5";
            "XF86AudioLowerVolume" = "exec --no-startup-id pamixer -d 5";
            "XF86Favorites" = "exec ${lockCmd}";
            # "XF86AudioMicMute" = "exec --no-startup-id pamixer -t";

            "XF86MonBrightnessUp" = "exec brightnessctl s +10%";
            "XF86MonBrightnessDown" = "exec brightnessctl s 10%-";
          };
        assigns = {
          "${ws_browser}" = [ { app_id = "chromium"; } ];
          "${ws_msg}" = [
            { app_id = "Slack"; }
            { app_id = "discord"; }
            { app_id = "org.telegram.desktop"; }
          ];
        };
        window.commands = [
          {
            criteria = {
              app_id = "floating_terminal";
            };
            command = "floating enable, sticky enable";
          }
          # firefox picture-in-picture
          {
            criteria = {
              title = "Picture-in-Picture";
            };
            command = "floating enable, sticky enable";
          }
          # chromium picture-in-picture
          {
            criteria = {
              title = "Picture in picture";
            };
            command = "floating enable, sticky enable";
          }
          {
            criteria = {
              title = "Firefox — Sharing Indicator";
            };
            command = "floating enable, no_focus, resize set 0 0, move absolute position 10 10";
          }
          {
            criteria = {
              app_id = "chrome-nngceckbapebfimnlniiiahkandclblb-Default";
            };
            command = "floating enable, sticky enable";
          }
        ];
      };
    };

    home = {
      packages = with pkgs; [
        brightnessctl
        slurp
        grim
        swappy
        swaylock-effects
        swayidle
        wl-clipboard
        kanshi
        bemenu
        wf-recorder
        xdg-desktop-portal-wlr
        wlroots_0_18
        swaykbdd
        wdisplays
      ];

      sessionVariables = {
        MOZ_ENABLE_WAYLAND = 1;
        NIXOS_OZONE_WL = 1;
        XDG_CURRENT_DESKTOP = "sway";
        SDL_VIDEODRIVER = "wayland";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
      };
    };
  };
}
