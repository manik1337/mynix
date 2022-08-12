{ pkgs, fetchFromGitHub }:

pkgs.vimUtils.buildVimPlugin {
  pname = "vimplugin-copilot.vim";
  version = "v1.5.0";

  src = fetchFromGitHub {
      owner = "github";
      repo = "copilot.vim";
      rev = "da286d8c52159026f9cba16cd0f98b609c056841";
      sha256 = "0y7f6db7qmlvk5swi95klgdq6bsdsfr9jy01400qdwxw0bbm5ini";
  };
}
