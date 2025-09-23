{
  stdenv,
  curl,
  jq,
}:
stdenv.mkDerivation {
  pname = "q-cli";
  version = "0.1.0";

  src = ../bin/q;

  dontUnpack = true;

  propagatedBuildInputs = [
    jq
    curl
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/q
    chmod +x $out/bin/q
  '';
}
