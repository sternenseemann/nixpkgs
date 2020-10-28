{ lib, fetchFromGitHub, buildDunePackage
, ocaml-compiler-libs, ocaml-migrate-parsetree, ppx_derivers
, sexplib0, stdlib-shims
}:

buildDunePackage rec {
  pname = "ppxlib";
  version = "0.15.0";

  minimumOCamlVersion = "4.04.1";

  src = fetchFromGitHub {
    owner = "ocaml-ppx";
    repo = pname;
    rev = version;
    sha256 = "1p037kqj5858xrhh0dps6vbf4fnijla6z9fjz5zigvnqp4i2xkrn";
  };

  propagatedBuildInputs = [
    ocaml-compiler-libs ocaml-migrate-parsetree ppx_derivers sexplib0 stdlib-shims
  ];

  meta = {
    description = "Standard library for ppx rewriters";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.sternenseemann ];
    inherit (src.meta) homepage;
  };
}
