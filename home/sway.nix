{ config, pkgs, ... }:
let
  ws1 = "1";
  ws2 = "2";
  ws3 = "3";
  ws4 = "4";
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
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraConfig = ''
      exec swaykbdd
      set $laptop eDP-1
      bindswitch --reload --locked lid:on output $laptop disable
      bindswitch --reload --locked lid:off output $laptop enable
      default_border none
      set $XCURSOR_SIZE 48
      seat seat0 xcursor_theme macOS-BigSur 48
    '';
    config = {
      gaps = {
        inner = 10;
        outer = 5;
      };
      terminal = "${pkgs.alacritty}/bin/alacritty";
      modifier = "Mod4";
      fonts = {
        names = [ "VictorMono Nerd Font" ];
        size = 10.0;
      };
      focus = {
        followMouse = "no";
        mouseWarping = false;
      };
      bars = [ ];
      menu = "${pkgs.rofi}/bin/rofi modi drun -show drun";
      startup = [
        { command = "${pkgs.mako}/bin/mako"; }
        { command = "systemctl --user restart waybar.service"; }
        {
          command = ''
            ${pkgs.swayidle}/bin/swayidle -w \
            timeout 600 ${lockCmd} \
            timeout 1200 'swaymsg "output * dpms off"' \
            resume 'swaymsg "output * dpms on"' \
            before-sleep ${lockCmd}
          '';
        }
      ];
      input = {
        "type:keyboard" = {
          xkb_layout = "us,ru";
          xkb_options = "grp:alt_shift_toggle,ctrl:nocaps";
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
      output = {
        "*" = { bg = "#000000 solid_color"; };
      };
      bindkeysToCode = true;
      keybindings =
        let
          mod = config.wayland.windowManager.sway.config.modifier;
          inherit (config.wayland.windowManager.sway.config) menu terminal;
        in
        {
          "${mod}+d" = "exec ${menu}";
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

          "${mod}+1" = "workspace ${ws1}";
          "${mod}+2" = "workspace ${ws2}";
          "${mod}+3" = "workspace ${ws3}";
          "${mod}+4" = "workspace ${ws4}";
          "${mod}+5" = "workspace ${ws5}";
          "${mod}+6" = "workspace ${ws6}";
          "${mod}+7" = "workspace ${ws7}";
          "${mod}+8" = "workspace ${ws8}";
          "${mod}+9" = "workspace ${ws9}";
          "${mod}+0" = "workspace ${ws10}";

          "${mod}+Shift+1" = "move container to workspace ${ws1}";
          "${mod}+Shift+2" = "move container to workspace ${ws2}";
          "${mod}+Shift+3" = "move container to workspace ${ws3}";
          "${mod}+Shift+4" = "move container to workspace ${ws4}";
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
          "${mod}+a" = "focus parent";
          "${mod}+s" = "focus child";
          "${mod}+Shift+s" = "sticky toggle";

          "${mod}+Shift+c" = "reload";
          "${mod}+Shift+r" = "restart";
          "${mod}+Shift+v" = ''mode "system:  [r]eboot  [p]oweroff  [l]ogout"'';

          "${mod}+r" = "mode resize";

          "${mod}+p" =
            "exec ${pkgs.slurp}/bin/slurp | ${pkgs.grim}/bin/grim -g - - | wl-copy -t image/png";
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
      window.commands = [
        {
          criteria = { app_id = "floating_terminal"; };
          command = "floating enable, sticky enable";
        }
        {
          criteria = { title = "Picture-in-Picture"; };
          command = "floating enable, sticky enable";
        }
        {
          criteria = { title = "Firefox — Sharing Indicator"; };
          command =
            "floating enable, no_focus, resize set 0 0, move absolute position 10 10";
        }
        {
          criteria = { class = "Godot"; };
          command = "floating enable, sticky enable";
        }
      ];
    };
  };
}
