{ lib, buildDunePackage, fetchFromGitHub, fetchurl
, ctypes, result
, alcotest
, file
}:

buildDunePackage rec {
  pname = "luv";
  version = "0.5.7";
  useDune2 = true;

  srcs = [
    # actual release tar ball with properly set up vendored C sources
    (fetchurl {
      url = "https://github.com/aantron/luv/releases/download/${version}/luv-${version}.tar.gz";
      sha256 = "0wjnw5riydnzsk1xdzljlpzdnjwpa0j597y6x6ma4990mqj54260";
    })
    # git repository which contains tests
    (fetchFromGitHub {
      name = "${pname}-git";
      owner = "aantron";
      repo = "luv";
      rev = "${version}";
      sha256 = "11y4853jwxq7q6555llczag02q9jyxcihp3kjh0w6m8ndz7h498y";
    })
  ];

  sourceRoot = "${pname}-${version}";

  postUnpack = ''
    chmod -R u+w ${pname}-*
    mv "${pname}-git/test" "${pname}-${version}/"
  '';

  postConfigure = ''
    for f in src/c/vendor/configure/{ltmain.sh,configure}; do
      substituteInPlace "$f" --replace /usr/bin/file file
    done
  '';

  nativeBuildInputs = [ file ];
  propagatedBuildInputs = [ ctypes result ];
  checkInputs = [ alcotest ];
  doCheck = true;

  meta = with lib; {
    homepage = "https://github.com/aantron/luv";
    description = "Binding to libuv: cross-platform asynchronous I/O";
    license = licenses.lgpl21;
    maintainers = [ maintainers.locallycompact maintainers.sternenseemann ];
  };
}
