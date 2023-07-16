{ appimageTools, fetchurl, ... }:
appimageTools.wrapType2 rec {
  pname = "ledger-live-desktop";
  version = "2.62.2";
  name = "${pname}-${version}";
  src = fetchurl {
    url = "https://download.live.ledger.com/${pname}-${version}-linux-x86_64.AppImage";
    hash = "sha256-Rb611v2QirGmJ01lZj6F3iHLTPI2eJp5acZDEQ4Ude0=";
  };
}
