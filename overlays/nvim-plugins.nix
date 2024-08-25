{ inputs, ... }: final: prev: {
  vimPlugins =
    prev.vimPlugins
    // {
      avante-nvim = prev.vimUtils.buildVimPlugin {
        name = "avante-nvim";
        src = inputs.avante-nvim;
      };
    };
}
