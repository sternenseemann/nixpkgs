{ stdenv 
, fetchgit
, gcc 
, cmake 
, libpng 
, libjpeg 
, libvorbis
, openal 
, SDL2 
, mbedtls 
, libuv 
, libGLU
}:

stdenv.mkDerivation rec {
  pname = "hashlink";
  version = "1.11";

  src = fetchgit {
    url = https://github.com/HaxeFoundation/hashlink;
    sha256 = "1bgx8pr062xsy81ygbakm3v033d68dqqx0dgfs0dczdqy8q0039k";
    rev = "refs/tags/1.11";
  };
  buildInputs = [
    gcc 
    cmake 
    libpng 
    libjpeg 
    libvorbis
    openal 
    SDL2 
    mbedtls 
    libuv 
    libGLU
  ];
}
