{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    experimentalBackends = true;

    blur = true;
    blurExclude = [ "window_type = 'dock'" "window_type = 'desktop'" ];

    fade = true;
    fadeDelta = 5;

    opacityRule = [ "95:class_g *?= 'emacs'" ];

    shadow = true;
    shadowOffsets = [ (-7) (-7) ];
    shadowOpacity = "0.7";
    shadowExclude = [ "window_type *= 'normal' && ! name ~= ''" ];
    noDockShadow = true;
    noDNDShadow = true;

    activeOpacity = "1.0";
    inactiveOpacity = "0.9";
    menuOpacity = "0.9";

    backend = "glx";
    vSync = true;

    extraOptions = ''
      shadow-radius = 7;
      frame-opacity = 0.7;
      blur-strength = 5;
      detect-client-opacity = true;
      detect-rounded-corners = true;
      detect-transient = true;
      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
    '';
  };
}
