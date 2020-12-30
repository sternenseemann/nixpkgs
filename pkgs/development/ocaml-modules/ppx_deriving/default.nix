{ lib, fetchzip, buildDunePackage
, cppo, ppx_derivers, ppxlib, result
, ounit2
}:

buildDunePackage rec {
  pname = "ppx_deriving";
  version = "5.2";

  useDune2 = true;

  minimumOCamlVersion = "4.05";

  src = fetchzip {
    url = "https://github.com/ocaml-ppx/ppx_deriving/archive/v${version}.tar.gz";
    sha256 = "1vv8k9mji3yrjsgj79zj47lijmmijzaal4yghzmrk9sjms9q17kf";
  };

  buildInputs = [ cppo ];
  propagatedBuildInputs = [ ppxlib ppx_derivers result ];

  doCheck = true;
  checkInputs = [ ounit2 ];

  meta = with lib; {
    description = "deriving is a library simplifying type-driven code generation on OCaml >=4.02.";
    maintainers = [ maintainers.maurer ];
    license = licenses.mit;
  };
}
