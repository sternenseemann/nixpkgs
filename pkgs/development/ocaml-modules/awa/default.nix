{ lib, buildDunePackage, fetchurl
, ppx_sexp_conv, ppx_cstruct
, mirage-crypto, mirage-crypto-rng, mirage-crypto-pk
, x509, cstruct, cstruct-unix, cstruct-sexp, sexplib
, rresult, mtime, logs, fmt, cmdliner, base64, mirage-crypto-ec
, zarith
}:

buildDunePackage rec {
  pname = "awa";
  version = "0.0.2";

  minimumOCamlVersion = "4.08";
  useDune2 = true;

  src = fetchurl {
    url = "https://github.com/mirage/awa-ssh/releases/download/v${version}/awa-v${version}.tbz";
    sha256 = "288c6599312882b00724049d103ac4f395149ddcc5ea2ca644698b4616ef4468";
  };

  nativeBuildInputs = [ ppx_sexp_conv ppx_cstruct ];

  propagatedBuildInputs = [
    mirage-crypto mirage-crypto-rng mirage-crypto-pk x509
    cstruct cstruct-sexp sexplib rresult mtime
    logs base64 mirage-crypto-ec zarith
  ];

  doCheck = true;
  checkInputs = [ cstruct-unix cmdliner fmt ];

  meta = with lib; {
    description = "SSH implementation in OCaml";
    license = licenses.isc;
    homepage = "https://github.com/mirage/awa-ssh";
    maintainers = [ maintainers.sternenseemann ];
  };
}
