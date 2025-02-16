{ inputs, ... }:
{
  imports = with inputs.self.nixosProfiles; [
    display
    nvim
    common
    direnv
    git
    packages
    security
    xdg
    zsh
    tmux
    stylix
  ];
}
