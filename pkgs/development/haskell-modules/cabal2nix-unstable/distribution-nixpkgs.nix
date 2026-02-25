# This file defines distribution-nixpkgs-unstable, used by maintainers/scripts/haskell/regenerate-hackage-packages.sh.
{
  mkDerivation,
  aeson,
  base,
  bytestring,
  Cabal,
  containers,
  deepseq,
  directory,
  fetchzip,
  hspec,
  language-nix,
  lens,
  lib,
  pretty,
  process,
}:
mkDerivation {
  pname = "distribution-nixpkgs";
  version = "1.7.1.1-unstable-2026-02-25";
  src = fetchzip {
    url = "https://github.com/NixOS/cabal2nix/archive/b9f494e66dc0866ae86857ddee99d4db578b03c4.tar.gz";
    sha256 = "1mhb9949zlkpgm0qfcf75dvk2hidnxddp6kl95scnlyaw6rwxvy6";
  };
  postUnpack = "sourceRoot+=/distribution-nixpkgs; echo source root reset to $sourceRoot";
  enableSeparateDataOutput = true;
  libraryHaskellDepends = [
    aeson
    base
    bytestring
    Cabal
    containers
    deepseq
    language-nix
    lens
    pretty
    process
  ];
  testHaskellDepends = [
    aeson
    base
    Cabal
    deepseq
    directory
    hspec
    language-nix
    lens
  ];
  homepage = "https://github.com/NixOS/cabal2nix/tree/master/distribution-nixpkgs#readme";
  description = "Types and functions to manipulate the Nixpkgs distribution";
  license = lib.licenses.bsd3;
}
