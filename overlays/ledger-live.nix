{ appimageTools, fetchurl, ... }:
appimageTools.wrapType2 rec {
  pname = "ledger-live-desktop";
  version = "2.47.0";
  name = "${pname}-${version}";
  src = fetchurl {
    url = "https://download.live.ledger.com/${pname}-${version}-linux-x86_64.AppImage";
    hash = "sha256-KmNiyWF74hHLLu+uQDiFAMJJvyU/rgyrBhh6O6iMVIg=";
  };
}
