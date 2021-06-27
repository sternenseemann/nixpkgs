{ lib
, buildDunePackage
, fetchurl
}:

buildDunePackage rec {
  pname = "vector";
  version = "1.0.0";

  src = fetchurl {
    url = "https://github.com/backtracking/vector/releases/download/${version}/vector-${version}.tbz";
    sha256 = "0hb6prpada4c5z07sxf5ayj5xbahsnwall15vaqdwdyfjgbd24pj";
  };

  useDune2 = true;
  doCheck = true;

  meta = {
    description = "Resizable Arrays";
    license = "LGPL-2.1-only WITH OCaml-LGPL-linking-exception";
    homepage = "https://github.com/backtracking/vector";
    maintainers = [ lib.maintainers.sternenseemann ];
  };
}
