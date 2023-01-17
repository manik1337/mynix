{pkgs, ...}:
{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "base16";
      themes = {
        base16 = {
          fg      = "#c5c8c6";
          bg      = "#1d1f21";
          black   = "#1d1f21";
          red     = "#cc6666";
          green   = "#b5bd68";
          yellow  = "#f0c674";
          blue    = "#81a2be";
          magenta = "#b294bb";
          cyan    = "#8abeb7";
          white   = "#c5c8c6";
          orange  = "#dc9656";
        };
      };
    };
  };
}
