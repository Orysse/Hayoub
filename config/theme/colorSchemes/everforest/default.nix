{ pkgs, ... }:

{
    stylix = {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
        image = ../../wallpapers/japan_store.jpg;
    };
}
