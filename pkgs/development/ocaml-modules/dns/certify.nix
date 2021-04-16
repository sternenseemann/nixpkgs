{ buildDunePackage, dns, dns-tsig, dns-mirage, randomconv, x509
, mirage-random, mirage-time, mirage-clock, mirage-stack
, logs, mirage-crypto-ec, mirage-crypto-pk, mirage-crypto-rng, lwt
}:

buildDunePackage {
  pname = "dns-certify";

  inherit (dns) version src useDune2 minimumOCamlVersion;

  propagatedBuildInputs = [
    dns
    dns-tsig
    dns-mirage
    randomconv
    x509
    mirage-random
    mirage-time
    mirage-clock
    mirage-stack
    logs
    mirage-crypto-ec
    mirage-crypto-pk
    mirage-crypto-rng
    lwt
  ];

  doCheck = true;

  meta = dns.meta // {
    description = "MirageOS let's encrypt certificate retrieval";
  };
}
