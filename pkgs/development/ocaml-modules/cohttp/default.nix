{ lib, fetchurl, buildDunePackage
, ppx_fields_conv, ppx_sexp_conv, stdlib-shims
, base64, fieldslib, jsonm, re, stringext, uri-sexp
}:

buildDunePackage rec {
	pname = "cohttp";
	version = "2.5.3";

	src = fetchurl {
		url = "https://github.com/mirage/ocaml-cohttp/releases/download/v${version}/cohttp-v${version}.tbz";
		sha256 = "0913804c7ialaqljj0m2x2cmys2r3k771rrwjklghbmmxrh7z4i1";
	};

	buildInputs = [ jsonm ppx_fields_conv ppx_sexp_conv ];

	propagatedBuildInputs = [ base64 fieldslib re stringext uri-sexp stdlib-shims ];

	meta = {
		description = "HTTP(S) library for Lwt, Async and Mirage";
		license = lib.licenses.isc;
		maintainers = [ lib.maintainers.vbgl ];
		homepage = "https://github.com/mirage/ocaml-cohttp";
	};
}
