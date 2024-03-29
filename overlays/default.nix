inputs: system: self: super: {
  # discord = super.discord.overrideAttrs (old: rec {
  #   version = "0.0.21";
  #   src = super.fetchurl {
  #     url =
  #       "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
  #     sha256 = "18rmw979vg8lxxvagji6sim2s5yyfq91lfabsz1wzbniqfr98ci8";
  #   };
  # });

  ledger-live = super.callPackage ./ledger-live.nix { };
}
