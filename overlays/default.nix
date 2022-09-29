self: super: rec {
  discord = super.discord.overrideAttrs (old: rec {
    version = "0.0.20";
    src = super.fetchurl {
      url =
        "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
      sha256 = "1355xiw0k0i6cbi1zcq7fphma6r8hz87lhm8ybg5s45032xz5znx";
    };
  });

  ledger-live = super.callPackage ./ledger-live.nix { };
  tmux-sessionizer = super.callPackage ../packages/tmux-sessionizer.nix { };
  google-dot-cursor = super.callPackage ../packages/google-dot.nix { };
}
