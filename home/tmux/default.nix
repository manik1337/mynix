{ pkgs, ... }:

let
  tmuxConf = builtins.readFile ./config.conf;
in
{
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    extraConfig = tmuxConf;
    escapeTime = 0;
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      cpu
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
    ];
    shortcut = "a";
    terminal = "screen-256color";
  };
}
