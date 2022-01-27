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
      ${pkgs.feh}/bin/feh --no-fehbg --bg-fill ~/wp.jpg
      xrandr --rate 144
      while true; do
          xsetroot -name \"$(status)\"
          sleep 30
      done";
    };
  };
}
