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

  # About runHooks: https://github.com/jtojnar/nixpkgs-hammering/blob/6a4f88d82ab7d0a95cf21494896bce40f7a4ac22/explanations/missing-phase-hooks.md
  buildPhase = ''
    runHook preBuild

    c++ -o ${pname} main.cpp

    runHook postBuild
  '';
  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin/
    cp ${pname} $out/bin/

    runHook postInstall
  '';

  meta = with lib; {
    description = "Uma calculadora simples de notação polonesa reversa";
    homepage = "https://github.com/matkijahenkilo/npr-calculator";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
