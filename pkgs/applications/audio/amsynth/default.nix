{ lib
, stdenv
, fetchurl
, intltool
, pkg-config
, pandoc
, gtk2
, lv2
, libjack2
, lash
, alsa-lib
}:

stdenv.mkDerivation rec {
  pname = "amsynth";
  version = "1.12.4";

  src = fetchurl {
    url = "https://github.com/amsynth/amsynth/releases/download/release-${version}/amsynth-${version}.tar.gz";
    sha256 = "1fabxx4nv5rsi4kjqachzh2r6zb40lszbv09gcz41ql8qslrw842";
  };

  nativeBuildInputs = [
    intltool
    pkg-config
    pandoc
  ];

  buildInputs = [
    gtk2
    lv2
    libjack2
    lash
    alsa-lib
  ];

  meta = {
    description = "Analog Modelling Synthesizer";
    homepage = "http://amsynth.github.io/";
    license = lib.licenses.gpl2Plus;
    maintainers = [ lib.maintainers.sternenseemann ];
    platforms = lib.platforms.linux; # macOS is possible in theory
  };
}
