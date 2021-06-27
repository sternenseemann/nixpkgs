{ lib, buildDunePackage, terminal
, fmt, logs, uucp, uutf, vector, optint, mtime
, alcotest, astring
}:

buildDunePackage rec {
  pname = "progress";

  inherit (terminal)
    useDune2
    minimumOCamlVersion
    src
    version
    ;

  propagatedBuildInputs = [
    terminal
    fmt
    logs
    uucp
    uutf
    vector
    optint
    mtime
  ];

  # requires alcotest >= 1.4.0
  doCheck = lib.versionAtLeast alcotest.version "1.4.0";
  checkInputs = [ alcotest astring ];

    description = "Progress bar library for OCaml";
}
