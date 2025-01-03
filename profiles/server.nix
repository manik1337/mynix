{ pkgs, ... }:
{
  home-manager.users.dmanik = {
    home.sessionVariables.EDITOR = "vim";
    home.packages = with pkgs; [
      wireguard-tools
    ];
    programs = {
      neovim = {
        enable = true;
        vimAlias = true;
      };
    };
  };
  services.teamspeak3 = {
    enable = true;
    openFirewall = true;
  };
}
