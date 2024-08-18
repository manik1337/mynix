{ inputs, ... }: {
  imports = with inputs.self.nixosProfiles; [
    common
    server
    git
    zsh
  ];
}
