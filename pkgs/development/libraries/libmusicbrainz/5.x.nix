{ stdenv, fetchurl, cmake, neon, libdiscid }:

stdenv.mkDerivation rec {
  name = "libmusicbrainz-5.0.1";

  buildInputs = [ cmake neon libdiscid ];

  src = fetchurl {
    url = "https://github.com/downloads/metabrainz/libmusicbrainz/${name}.tar.gz";
    sha256 = "1mc2vfsnyky49s25yc64zijjmk4a8qgknqw21l5n58sra0f5x9qw";
};

  dontUseCmakeBuildDir=true;

  meta = {
    homepage = http://musicbrainz.org/doc/libmusicbrainz;
    description = "MusicBrainz Client Library (5.x version)";
    longDescription = ''
      The libmusicbrainz (also known as mb_client or MusicBrainz Client
      Library) is a development library geared towards developers who wish to
      add MusicBrainz lookup capabilities to their applications.'';
    maintainers = [ stdenv.lib.maintainers.urkud ];
    platforms = stdenv.lib.platforms.all;
  };
}
