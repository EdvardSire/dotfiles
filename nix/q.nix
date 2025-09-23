{
  stdenv,
  lib,
  makeWrapper,
  curl,
  jq,
}:
stdenv.mkDerivation {
  pname = "q-cli";
  version = "0.1.0";

  src = ../bin/q;
  dontUnpack = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/q
    chmod +x $out/bin/q
    wrapProgram $out/bin/q \
      --prefix PATH : ${
        lib.makeBinPath [
          jq
          curl
        ]
      }
  '';
}
