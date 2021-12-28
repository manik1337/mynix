{ config, pkgs, lib, ... }:

{
  # create ~/.config/systemd/user/default.target.wants/redshift.service to enable
  services.redshift = {
    enable = true;
    settings.redshift = {
      brightness-day = "1";
      brightness-night = "1";
    };
    temperature = {
      day = 5500;
      night = 3000;
    };
    latitude = "55.8";
    longitude = "37.6";
  };
}
