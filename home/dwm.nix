{ pkgs, ... }:

{
  home.file = {
    ".local/share/dwm/autostart.sh" = {
      executable = true;
      text = "
      #!/bin/sh
      status () { 
          echo -n \"$(date '+%m/%d %H:%M') \"
      }
      setxkbmap -layout us,ru -option grp:alt_shift_toggle
      xrandr --auto --output DP-0 --primary --rate 144 --output HDMI-0 --right-of DP-0
      ${pkgs.feh}/bin/feh --no-fehbg --bg-fill ~/wp.jpg
      while true; do
          xsetroot -name \"$(status)\"
          sleep 30
      done";
    };
  };
}
