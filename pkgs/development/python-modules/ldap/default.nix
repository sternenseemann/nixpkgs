{ buildPythonPackage, fetchPypi
, pyasn1, pyasn1-modules, isPy27, pytest
, openldap, cyrus_sasl, lib, stdenv }:

buildPythonPackage rec {
  pname = "python-ldap";
  version = "3.3.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "198as30xy6p760niqps2zdvq2xcmr765h06pmda8fa9y077wl4a7";
  };

  propagatedBuildInputs = [ pyasn1 pyasn1-modules ];

  checkInputs = lib.optional isPy27 pytest;
  buildInputs = [ openldap cyrus_sasl ];

  checkPhase = ''
    # Needed by tests to setup a mockup ldap server.
    export BIN="${openldap}/bin"
    export SBIN="${openldap}/bin"
    export SLAPD="${openldap}/libexec/slapd"
    export SCHEMA="${openldap}/etc/schema"
  '' + (if isPy27 then ''
    py.test
  '' else ''
    python -bb -Werror -m unittest discover -v -s Tests -p 't_*'
  '');

  doCheck = !stdenv.isDarwin;

  meta = with lib; {
    description = "Python modules for implementing LDAP clients";
    homepage = "https://www.python-ldap.org/";
    license = licenses.psfl;
  };
}
