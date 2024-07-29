{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "stepanzubkov";
    repo = "where-is-my-sddm-theme";
    rev = "29bd947efe30457119fdfdcca5340b3a45eb7acd";
    sha256 = "1ciqzq4l1plkhl5jl4c6hvh2lbxv7p2ckjvi3m40glxhpzws6zhf";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./where_is_my_sddm_theme_qt5/* $out/
   '';
}
