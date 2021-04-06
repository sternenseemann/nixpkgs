{ lib, stdenv, fetchurl, zlib }:

stdenv.mkDerivation rec {
  pname = "mandoc";
  version = "1.14.5";

  src = fetchurl {
    url = "https://mandoc.bsd.lv/snapshots/mandoc-${version}.tar.gz";
    sha256 = "1xyqllxpjj1kimlipx11pzyywf5c25i4wmv0lqm7ph3gnlnb86c2";
  };

  buildInputs = [ zlib ];

  # HOMEBREWDIR specificies a directory symlinks in
  # MANPATH may point to when indexing using makewhatis(8).
  # By setting it to /nix/store we can index the man pages
  # in /run/current-system instead of them being skipped
  # because they are symlinks pointing outside of the
  # indexed directory.
  # More context can be found in
  # * configure.local.example in the source tarball
  # * https://inbox.vuxu.org/mandoc-tech/c9932669-e9d4-1454-8708-7c8e36967e8e@systemli.org/T/
  configureLocal = ''
    HOMEBREWDIR=/nix/store
    HAVE_WCHAR=1
    MANPATH_DEFAULT="/run/current-system/sw/share/man"
    OSNAME="NixOS"
    PREFIX="$out"
    HAVE_MANPATH=1
    LD_OHASH="-lutil"
    BUILD_DB=0
    CC=${stdenv.cc.targetPrefix}cc
  '';

  patches = [
    ./remove-broken-cc-check.patch
  ];

  preConfigure = ''
    echo $configureLocal > configure.local
  '';

  meta = with lib; {
    homepage = "https://mandoc.bsd.lv/";
    description = "suite of tools compiling mdoc and man";
    downloadPage = "http://mandoc.bsd.lv/snapshots/";
    license = licenses.bsd3;
    platforms = platforms.all;
    maintainers = with maintainers; [
      bb010g ramkromberg sternenseemann
    ];
  };
}
