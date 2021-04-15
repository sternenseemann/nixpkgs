{ lib, fetchurl, buildDunePackage, ppx_sexp_conv, ppx_cstruct, cstruct
, cstruct-sexp, sexplib, mirage-crypto, mirage-crypto-pk, mirage-crypto-rng
, x509, domain-name, fmt, cstruct-unix, ounit2, ocaml_lwt, ptime
, rresult, mirage-crypto-ec, hkdf, logs, alcotest }:

buildDunePackage rec {
  minimumOCamlVersion = "4.08";

  version = "0.13.0";
  pname = "tls";

  src = fetchurl {
    url = "https://github.com/mirleft/ocaml-tls/releases/download/v${version}/tls-v${version}.tbz";
    sha256 = "01fc67eff2ad5cd3c59ffdb55ee64ba78772cad963f7f1a1bef0b3935eb17ccd";
  };

  useDune2 = true;

  doCheck = true;
  checkInputs = [ cstruct-unix ounit2 alcotest ];

  propagatedBuildInputs = [ ppx_sexp_conv ppx_cstruct cstruct cstruct-sexp
                            sexplib mirage-crypto mirage-crypto-pk mirage-crypto-rng
                            x509 domain-name fmt ocaml_lwt ptime mirage-crypto-ec
                            hkdf logs rresult ];

  meta = with lib; {
    homepage = "https://github.com/mirleft/ocaml-tls";
    description = "TLS in pure OCaml";
    license = licenses.bsd2;
    maintainers = with maintainers; [ sternenseemann ];
  };
}
