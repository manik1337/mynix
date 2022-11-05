{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Dmitrii Manik";
    userEmail = "manikdmitry@gmail.com";
    extraConfig = {
      push.default = "current";
      pull.ff = "only";
      core.qoutePath = false;
      merge.confictStyle = "diff3";
      core.editor = "v";
    };
  };
}
