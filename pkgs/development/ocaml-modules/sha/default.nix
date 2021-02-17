{ lib
, fetchgit
, buildDunePackage
, ounit
}:

buildDunePackage rec {
  pname = "sha";
  version = "1.13";

  useDune2 = true;

  src = fetchgit {
    url = "https://github.com/arthurteisseire/ocaml-${pname}.git";
    sha256 = "1nfirappw3kspf45vp6f78lg36ksk30d7b2c7ymzqw71hybazs26";
    rev = "355de5cba805b2d79e51a2636c2056e72f3f1136";
  };

  doCheck = true;
  checkInputs = [ ounit ];

  meta = with lib; {
    description = "Binding for SHA interface code in OCaml";
    maintainers = [ maintainers.arthurteisseire ];
    homepage = "https://github.com/djs55/ocaml-${pname}";
    license = licenses.isc;
  };

}
