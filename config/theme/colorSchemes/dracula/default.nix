{ pkgs, ... }:

{
    stylix = {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
        image = ../../wallpapers/marija_sister.jpg;
    };
}
