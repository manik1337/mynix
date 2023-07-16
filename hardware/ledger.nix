# reload udev rules
# udevadm trigger
# udevadm control --reload-rules
{ pkgs, ... }: {
  services.udev.packages = [ pkgs.ledger-udev-rules ];
}
