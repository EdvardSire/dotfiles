let
  pkgs = import <nixpkgs> { };
in
pkgs.callPackage ./nix/neovim.nix { }
