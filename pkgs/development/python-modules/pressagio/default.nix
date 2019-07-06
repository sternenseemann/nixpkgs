{ lib
, buildPythonPackage
, fetchPypi
, python
}:


buildPythonPackage rec {
  pname = "pressagio";
  version = "0.1.6";

  src = fetchPypi {
    inherit pname version;
    extension = "tar.gz";
    sha256 = "0xkwlw16435ry72zppjl9hb0sss1mkj8id9yk534yki8npq3r7ws";
  };

  meta = {
    description = "Pressagio is a library that predicts text based on n-gram models";
    homepage = https://github.com/cidles/pressagio;
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ sternenseemann ];
  };
}
