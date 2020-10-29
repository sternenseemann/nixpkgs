{ lib, buildDunePackage, fetchurl, alcotest, asn1-combinators, benchmark
, bigarray-compat, cstruct, eqaf, hex, ppx_deriving_yojson, rresult
, stdlib-shims, yojson, dune-configurator, pkg-config }:

buildDunePackage rec {
  pname = "fiat-p256";
  version = "0.2.2";

  useDune2 = true;

  src = fetchurl {
    url = "https://github.com/mirage/fiat/releases/download/v${version}/${pname}-v${version}.tbz";
    sha256 = "1vf8xzs27yggspaz722wdn7gs80bs6vamkjiz2jbmh5h1j020apk";
  };

  # test is currently broken due to ppx_deriving.std's kind (ppx deriver)
  # not being recognized correctly by dune 2.7
  prePatch = ''
    rm -rf test/helpers/wycheproof test/wycheproof/dune
  '';

  nativeBuildInputs = [ pkg-config dune-configurator ];
  propagatedBuildInputs = [ bigarray-compat cstruct eqaf hex ];
  checkInputs = [ alcotest asn1-combinators benchmark
                  ppx_deriving_yojson rresult stdlib-shims yojson ];
  doCheck = true;

  meta = with lib; {
    description = "Primitives for Elliptic Curve Cryptography taken from Fiat";
    homepage = "https://github.com/mirage/fiat";
    license = licenses.mit;
    maintainers = with maintainers; [ sternenseemann ];
  };
}
