{ appimageTools, fetchurl, ... }:
appimageTools.wrapType2 rec {
  pname = "ledger-live-desktop";
  version = "2.77.2";
  name = "${pname}-${version}";
  src = fetchurl {
    url =
      "https://download.live.ledger.com/${pname}-${version}-linux-x86_64.AppImage";
    hash = "sha256-orIyfRs6TJgqGGLpl2tvoUtejsB0ni8xRK0SboP2LHw=";
  };
}
