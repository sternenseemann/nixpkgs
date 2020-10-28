{ lib, fetchzip, buildDunePackage
, ppx_derivers, result, ocaml-migrate-parsetree, ppxlib
, ounit, cppo, findlib
}:

buildDunePackage rec {
  pname = "ppx_deriving";
  version = "5.1";

  minimumOCamlVersion = "4.05";

  src = fetchzip {
    url = "https://github.com/ocaml-ppx/ppx_deriving/archive/v${version}.tar.gz";
    sha256 = "0as0hy606vsbc4bf72vh2v23vdfaqlay22mlw6wbkr5b2l6w5b4w";
  };

  buildInputs = [ cppo ];
  propagatedBuildInputs = [
    ppxlib findlib ocaml-migrate-parsetree ppx_derivers result
  ];

  checkInputs = [ ounit ];
  doCheck = true;

  meta = with lib; {
    description = "deriving is a library simplifying type-driven code generation on OCaml";
    maintainers = [ maintainers.maurer ];
    license = licenses.mit;
  };
}
