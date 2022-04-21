{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Dmitry Manik";
    userEmail = "manikdmitry@gmail.com";
    extraConfig = {
      push.default = "current";
      pull.ff = "only";
      core.qoutePath = false;
      merge.confictStyle = "diff3";
      core.editor = "emacsclient";
    };
  };
}
