{ inputs, ... }: {
  imports = with inputs.self.nixosProfiles; [
    ./base.nix
    display
    nvim
    common
    direnv
    git
    packages
    security
    xdg
    zsh
  ];
}
