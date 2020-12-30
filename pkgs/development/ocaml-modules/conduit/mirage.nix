{ buildDunePackage, conduit-lwt
, sexplib, cstruct, mirage-stack, mirage-clock, mirage-flow
, mirage-flow-combinators, mirage-random, mirage-time
, dns-client, vchan, xenstore, tls, tls-mirage
, ipaddr, ipaddr-sexp, ppx_sexp_conv
}:

buildDunePackage {
  pname = "conduit-mirage";

  inherit (conduit-lwt) version src useDune2 minimumOCamlVersion;

  nativeBuildInputs = [
    ppx_sexp_conv
  ];

  propagatedBuildInputs = [
    sexplib
    cstruct
    mirage-stack
    mirage-clock
    mirage-flow
    mirage-flow-combinators
    mirage-random
    mirage-time
    dns-client
    conduit-lwt
    vchan
    xenstore
    tls
    tls-mirage
    ipaddr
    ipaddr-sexp
  ];

  meta = conduit-lwt.meta // {
    description = "A network connection establishment library for MirageOS";
  };
}
