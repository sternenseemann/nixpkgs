{ lib
, buildDunePackage
, fetchurl
, stdlib-shims
, uucp
, uutf
, fmt
, astring
, mtime
, alcotest
}:

buildDunePackage rec {
  pname = "terminal";
  version = "0.2.0";

  minimumOCamlVersion = "4.03";
  useDune2 = true;

  src = fetchurl {
    url = "https://github.com/CraigFe/progress/releases/download/${version}/terminal-${version}.tbz";
    sha256 = "7a92f6aede3d5010a30e6e47ccbc8380cc5bece8ac95c508323eb25272e6ddd3";
  };

  buildInputs = [
    stdlib-shims
  ];

  propagatedBuildInputs = [
    uucp
    uutf
  ];

  # disable until we have upgraded to alcotest >= 1.4.0
  doCheck = lib.versionAtLeast alcotest.version "1.4.0";
  checkInputs = [
    fmt
    astring
    mtime
    alcotest
  ];

  meta = with lib; {
    description = "Basic utilities for interacting with terminals";
    homepage = "https://github.com/CraigFe/progress";
    license = licenses.mit;
    maintainers = [ maintainers.sternenseemann ];
  };
}
