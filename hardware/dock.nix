{ pkgs, ... }: {
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="thunderbolt", ATTR{authorized}=="0", ATTR{authorized}="1"
  '';
}
