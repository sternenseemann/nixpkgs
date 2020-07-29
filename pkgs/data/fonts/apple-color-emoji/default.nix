{ stdenv, lib, fetchFromGitHub, python3, zopfli, pngquant, imagemagick, which }:

let
  python = python2.withPackages (
    ps: with ps; [
      fonttools
      nototools
    ]
  );

in
stdenv.mkDerivation rec {
  pname = "apple-color-emoji";
  version = "unstable-2020-04-13";

  src = fetchFromGitHub {
    owner = "samuelngs";
    repo = "apple-emoji-linux";
    rev = "3539da931e8bb096261aefa383cbda23d1e20f1f";
    sha256 = "1jbhm1plr1axhdsgxlqp5z9b43p8k082hd2mzjllqgwn48zkvwwf";
  };

  dontConfigure = true;

  nativeBuildInputs = [ python zopfli pngquant imagemagick which ];

  enableParallelBuilding = true;

  makeFlags = [ "PREFIX=${placeholder "out"}" ];

  meta = with stdenv.lib; {
    description = "Color typeface used by iOS and macOS to display emoji";
    homepage = "https://github.com/samuelngs/apple-emoji-linux";
    license = with licenses; [ ofl asl20 ];
    maintainers = with maintainers; [ btwiusegentoo ];
  };
}
