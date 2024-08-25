{ inputs, ... }:
let
  nvim-plugins = import ./nvim-plugins.nix { inherit inputs; };
  # ledger-live = import ./ledger-live.nix { inherit inputs; };
  # ledger-live = inputs.callPackage ./ledger-live.nix { };
in
[
  nvim-plugins
  # ledger-live
]
