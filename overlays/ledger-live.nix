{ appimageTools, fetchurl, ... }:
appimageTools.wrapType2 rec {
  pname = "ledger-live-desktop";
  version = "2.46.0";
  name = "${pname}-${version}";
  src = fetchurl {
    url =
      "https://github.com/LedgerHQ/${pname}/releases/download/v${version}/${pname}-${version}-linux-x86_64.AppImage";
    hash = "sha256-QbCiOzASqicd0Tns1sV9ZVoc/GmuoohB9wB/g0Z6uFA=";
  };
}
