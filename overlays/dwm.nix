self: super: {
  dwm = super.dwm.overrideAttrs (oldAttrs: rec {
    configFile = super.writeText "config.h" (builtins.readFile ./dwm-config.h);
    postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} config.def.h";
    patches = [
      ./dwm-patches/dwm-fibonacci-6.2.diff
      ./dwm-patches/dwm-pertag-6.2.diff
      ./dwm-patches/dwm-autostart-20210120-cb3f58a.diff
      ./dwm-patches/dwm-attachbottom-6.2.diff
      ./dwm-patches/dwm-actualfullscreen-20211013-cb3f58a.diff
      # ./dwm-patches/dwm-systray-6.2.diff
    ];
  });
}
