{
    nixpkgs,
    system
}:
let 
  pkgs = import nixpkgs {
      inherit system;
      config = {
          allowUnfree = true;
      };
  };

  version = "3.9.3";
  url = "https://edvarsir.folk.ntnu.no/rofiles/PlotJuggler-v${version}-${system}.AppImage";
  src = pkgs.fetchurl {
    name = "Plotjuggler-${version}.AppImage";
    inherit url;
    sha256 = if system == "x86_64-linux" then
      "sha256-7LCENiZD077YzbuTPNLixd7lH5QktBf//xi43Ggn/Zs="
    else if system == "aarch64-linux" then # assume aarch64-linux
      "sha256-ZqFxkFzMS8b9EzHfCww1RDgq0lEwXWuY5qXxyO6gcBg="
    else
      throw "Only built for x86 and aarch64";
  };
in
pkgs.appimageTools.wrapType2 {
  pname = "plotjugger-bin";
  inherit version;
  src = src;
}
