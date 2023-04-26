{ stdenv, fetchurl }:

stdenv.mkDerivation {
  pname = "google-dot-cursor-theme";
  version = "1.1.3";

  src = fetchurl {
    url =
      "https://github.com/ful1e5/Google_Cursor/releases/download/v1.1.3/GoogleDot-Blue.tar.gz";
    sha256 = "1s4shsc7q79gxq99fidlnz8w0knwsvgkma8lna6mcqmydxq4h8aw";
  };

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r cursor.theme cursors index.theme $out/share/icons/
  '';
}

