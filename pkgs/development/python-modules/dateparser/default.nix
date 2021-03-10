{ lib
, buildPythonPackage
, isPy27
, fetchFromGitHub
, flake8
, parameterized
, pytestCheckHook
, GitPython
, ruamel_yaml
, dateutil
, pytz
, regex
, tzlocal
, hijri-converter
, convertdate
}:

buildPythonPackage rec {
  pname = "dateparser";
  version = "1.0.0";

  disabled = isPy27;

  src = fetchFromGitHub {
    owner = "scrapinghub";
    repo = "dateparser";
    rev = "v${version}";
    sha256 = "0i6ci14lqfsqrmaif57dyilrjbxzmbl98hps1b565gkiy1xqmjhl";
  };

  checkInputs = [
    parameterized
    pytestCheckHook
    GitPython
    ruamel_yaml
  ];

  pytestFlagsArray = [ "tests" ];

  propagatedBuildInputs = [
    # install_requires
    dateutil pytz regex tzlocal
    # extra_requires
    hijri-converter convertdate
  ];

  pythonImportsCheck = [ "dateparser" ];

  meta = with lib; {
    description = "Date parsing library designed to parse dates from HTML pages";
    homepage = "https://github.com/scrapinghub/dateparser";
    license = licenses.bsd3;
    maintainers = with maintainers; [ dotlambda ];
  };
}
