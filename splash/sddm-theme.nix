{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";

  src = pkgs.fetchFromGitHub {
    owner = "pivner";
    repo = "sddm-rose-pine";
    rev = "a7840f52472e2716e5e5e82f84917bf4173eb6cc";
    sha256 = "06ad5xvpg6hqcizqx10l656wnr2fqs6d218bhnx0q02db6aa6y7r";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
