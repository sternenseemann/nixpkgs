{ stdenv, fetchgit, wrapGAppsHook
, libxkbcommon, cairo, wayland
, pkgconfig, wayland-protocols, meson, ninja }:

stdenv.mkDerivation rec {
  pname = "virtboard";
  version = "0.0.6";

  src = fetchgit {
    url = "https://source.puri.sm/Librem5/virtboard";
    rev = "v${version}";
    sha256 = "09wvsr4ddfajcbp2ipnh8j7pwfclgvlynfi4kwnlpk3571b00fxs";
  };

  nativeBuildInputs = [ wrapGAppsHook pkgconfig wayland-protocols meson ninja ];
  buildInputs = [ libxkbcommon cairo wayland ];
}
