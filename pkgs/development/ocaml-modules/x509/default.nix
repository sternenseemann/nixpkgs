{ lib, fetchurl, buildDunePackage, fetchpatch
, alcotest, cstruct-unix
, asn1-combinators, domain-name, fmt, gmap, rresult, mirage-crypto, mirage-crypto-pk
, mirage-crypto-ec, mirage-crypto-rng, logs, base64, pbkdf
}:

buildDunePackage rec {
  minimumOCamlVersion = "4.08";

  pname = "x509";
  version = "0.12.0";

  src = fetchurl {
    url = "https://github.com/mirleft/ocaml-x509/releases/download/v${version}/x509-v${version}.tbz";
    sha256 = "300529159fad2c1bca33920a3b5f691f3393b7670892a4c0075521ab914ce511";
  };

  useDune2 = true;

  buildInputs = [ alcotest cstruct-unix ];
  propagatedBuildInputs = [
    asn1-combinators domain-name fmt gmap mirage-crypto mirage-crypto-pk
    mirage-crypto-ec mirage-crypto-rng rresult logs base64 pbkdf
  ];

  doCheck = true;

  meta = with lib; {
    homepage = "https://github.com/mirleft/ocaml-x509";
    description = "X509 (RFC5280) handling in OCaml";
    license = licenses.bsd2;
    maintainers = with maintainers; [ vbgl ];
  };
}
