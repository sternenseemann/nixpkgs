{ lib
, buildDunePackage
, fetchurl
, rresult
, mirage-crypto
, mirage-clock
, x509
, logs
, fmt
, hex
, bos
, astring
, cmdliner
, alcotest
}:

buildDunePackage rec {
  pname = "ca-certs-nss";
  version = "3.63";

  minimumOCamlVersion = "4.07";

  src = fetchurl {
    url = "https://github.com/mirage/ca-certs-nss/releases/download/v${version}/ca-certs-nss-v${version}.tbz";
    sha256 = "9b7739fc62d21b4dc5c806d6b7e4d867e45391eb149cab6b2301e0a27aa4f44c";
  };

  useDune2 = true;

  propagatedBuildInputs = [
    rresult
    mirage-crypto
    mirage-clock
    x509
  ];

  buildInputs = [
    logs
    fmt
    hex
    bos
    astring
    cmdliner
  ];

  doCheck = true;
  checkInputs = [ alcotest ];

  meta = with lib; {
    license = licenses.isc;
    description = "X.509 trust anchors extracted from Mozilla's NSS";
    maintainers = [ maintainers.sternenseemann ];
    homepage = "https://github.com/mirage/ca-certs-nss";
  };
}
