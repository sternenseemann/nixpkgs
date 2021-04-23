{ lib, fetchFromGitHub, fetchpatch, ocamlPackages }:

with ocamlPackages;

buildDunePackage rec {
  pname = "jackline";
  version = "unstable-2020-09-03";

  minimumOCamlVersion = "4.08";

  useDune2 = true;

  src = fetchFromGitHub {
    owner  = "hannesm";
    repo   = "jackline";
    rev    = "dd5f19636c9b99b72c348f0f639452d87b7c017c";
    sha256 = "076smdgig4nwvqsqxa6gsl0c3daq5agwgzp4n2y8xxm3qiq91y89";
  };

  patches = [
    (fetchpatch {
      url = "https://github.com/sternenseemann/jackline/commit/a4d3333e9ab0121fa7db6b4f4166d31d84970d00.patch";
      sha256 = "01xsh2c0d6m5barmp55w8l5a1m85jfr24hi42p11qz85mxxqsjqb";
    })
  ];

  nativeBuildInpts = [
    ppx_sexp_conv
    ppx_deriving
  ];

  buildInputs = [
    erm_xmpp
    tls
    mirage-crypto-pk
    x509
    domain-name
    ocaml_lwt
    otr
    astring
    ptime
    notty
    sexplib
    hex
    uutf
    uchar
    uuseg
    uucp
    dns-client
    cstruct
    base64
  ];

  meta = with lib; {
    homepage = "https://github.com/hannesm/jackline";
    description = "minimalistic secure XMPP client in OCaml";
    license = licenses.bsd2;
    maintainers = with maintainers; [ sternenseemann ];
  };
}
