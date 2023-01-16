self: super: rec {
  discord = super.discord.overrideAttrs (old: rec {
    version = "0.0.21";
    src = super.fetchurl {
      url =
        "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
      sha256 = "18rmw979vg8lxxvagji6sim2s5yyfq91lfabsz1wzbniqfr98ci8";
    };
  });

  lazygit = super.lazygit.overrideAttrs (old: rec {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "jesseduffield";
      repo = "lazygit";
      rev = "d69b2fef9a164ee082b93096110aa23a37c77334";
      sha256 = "01zl91d8vi2nwrslyjg5s5jisvll7js3zb9yr8g4m9h0nk7kcvjq";
    };
  });

  ledger-live = super.callPackage ./ledger-live.nix { };
  google-dot-cursor = super.callPackage ../packages/google-dot.nix { };
}
