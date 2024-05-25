{
  home-manager.users.dmanik.programs.git = {
    enable = true;
    userName = "Dmitrii Manik";
    userEmail = "manikdmitry@gmail.com";
    extraConfig = {
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
