{ stdenv, lib, fetchFromGitHub, }:

stdenv.mkDerivation rec {
  pname = "npr-calculator";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "matkijahenkilo";
    repo = pname;
    rev = "${version}";
    sha256 = "sha256-7KqMG/rNk26R03GVXKLPaTyQUZsmw5UWHK7nUcCLcRo=";
  };

  buildPhase = ''
    c++ -o main main.cpp
  '';
  installPhase = ''
    mkdir -p $out/bin/
    cp main $out/bin/
  '';

  meta = with lib; {
    description = "Uma calculadora simples de notação polonesa reversa";
    homepage = "https://github.com/matkijahenkilo/${pname}";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
