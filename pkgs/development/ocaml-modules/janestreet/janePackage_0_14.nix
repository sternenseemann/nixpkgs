{ lib, fetchFromGitHub, buildDunePackage, defaultVersion ? "0.14.0" }:

{ pname, version ? defaultVersion, hash, ...}@args:

buildDunePackage (args // {
  useDune2 = true;
  inherit version;

  minimumOCamlVersion = "4.08";

  src = fetchFromGitHub {
    owner = "janestreet";
    repo = pname;
    rev = "v${version}";
    sha256 = hash;
  };

  meta.license = lib.licenses.mit;
  meta.homepage = "https://github.com/janestreet/${pname}";
})
