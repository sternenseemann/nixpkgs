{ buildDunePackage, carton
, lwt, decompress, optint, bigstringaf
, alcotest, alcotest-lwt, cstruct, fmt, logs
, mirage-flow, result, rresult, bigarray-compat
, ke, base64, bos, checkseum, digestif, fpath, mmap
, stdlib-shims
, non-ocaml-git # pkgs.git
}:

buildDunePackage {
  pname = "carton-lwt";

  inherit (carton) version src useDune2 minimumOCamlVersion postPatch;

  propagatedBuildInputs = [
    carton
    lwt
    decompress
    optint
    bigstringaf
  ];

  doCheck = true;
  checkInputs = [
    non-ocaml-git
    alcotest
    alcotest-lwt
    cstruct
    fmt
    logs
    mirage-flow
    result
    rresult
    bigarray-compat
    ke
    base64
    bos
    checkseum
    digestif
    fpath
    mmap
    stdlib-shims
  ];

  inherit (carton) meta;
}
