{ lib
, stdenv
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
, installShellFiles
, makeWrapper
}:

rustPlatform.buildRustPackage rec {
  pname = "tmux-sessionizer";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "jrmoulton";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-sX4bLs0CfDBWW0tHYBNHg9KKBh3yJ27ezMxZbpUIQ6M=";
  };
  cargoSha256 = "sha256-BawEl//ENW7T6wt1f9IMbS9ntRGiWj4EZxucwVdW1vM=";

  buildInputs = [ openssl.dev ];

  nativeBuildInputs = [ pkg-config installShellFiles makeWrapper ];

  checkFlags = [ "--skip=pager_more" "--skip=pager_most" ];

  doInstallCheck = true;
  installCheckPhase = ''
    runHook preInstallCheck
    $out/bin/tms --help
    runHook postInstallCheck
  '';

  meta = with lib; {
    description = "The fastest way to manage projects as tmux sessions";
    homepage = "https://github.com/jrmoulton/tmux-sessionizer";
    changelog = "https://github.com/jrmoulton/tmux-sessionizer/commits/v${version}";
    maintainers = with maintainers; [ manikdv ];
  };
}
