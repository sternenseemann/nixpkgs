{ lib, buildDunePackage, fetchurl
, ke, duff, decompress, cstruct, optint, bigstringaf, stdlib-shims
, bigarray-compat, checkseum, logs, psq, fmt
, result, rresult, fpath, base64, bos, digestif, mmap, alcotest
, crowbar, alcotest-lwt, lwt, findlib, mirage-flow
}:

buildDunePackage rec {
  pname = "carton";
  version = "0.1.0";

  useDune2 = true;
  minimumOCamlVersion = "4.08";

  src = fetchurl {
    url = "https://github.com/mirage/ocaml-git/releases/download/${pname}-v${version}/${pname}-${pname}-v${version}.tbz";
    sha256 = "1s029sdgshx2y8rw99dh4zxb5w8hf5zzd8vd9jkax8lx0gqp5krg";
  };

  # remove changelogs for mimic and the git* packages
  postPatch = ''
    rm CHANGES.md CHANGES.mimic.md
  '';

  propagatedBuildInputs = [
    ke
    duff
    decompress
    cstruct
    optint
    bigstringaf
    stdlib-shims
    bigarray-compat
    checkseum
    logs
    psq
    fmt
  ];

  doCheck = true;
  checkInputs = [
    result
    rresult
    fpath
    base64
    bos
    digestif
    mmap
    alcotest
    alcotest-lwt
    crowbar
    lwt
    findlib
    mirage-flow
  ];

  meta = with lib; {
    description = "Implementation of PACKv2 file in OCaml";
    license = licenses.mit;
    homepage = "https://github.com/mirage/ocaml-git";
    maintainers = [ maintainers.sternenseemann ];
  };
}
