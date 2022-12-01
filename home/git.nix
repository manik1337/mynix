{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Dmitrii Manik";
    userEmail = "manikdmitry@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      push.default = "current";
      pull.ff = "only";
      core = {
        editor = "vim";
        qoutePath = false;
      };
      merge.confictStyle = "diff3";
    };
  };
}
