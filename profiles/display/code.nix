{ pkgs, ...}:
{
  home-manager.users.dmanik = {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
  };
}
