{
  pkgs,
  ...
}:

# let inherit (import ../../hosts/${host}/options.nix) colorScheme; in
{
    stylix = {
        enable = true;
        # base16Scheme = "${pkgs.base16-schemes}/share/themes/${colorScheme}.yaml";
        # image = ./wallpapers/everforest.jpg;
        polarity = "dark";
        opacity.terminal = 0.8;
        cursor.package = pkgs.bibata-cursors;
        cursor.name = "Bibata-Modern-Ice";
        cursor.size = 24;
        fonts = {
            monospace = {
                package = pkgs.nerdfonts.override { fonts = [ "IosevkaTerm" ]; };
                name = "IosevkaTerm Nerd Font";
            };
            sansSerif = {
                package = pkgs.montserrat;
                name = "Montserrat";
            };
            serif = {
                package = pkgs.montserrat;
                name = "Montserrat";
            };
            sizes = {
                applications = 12;
                terminal = 15;
                desktop = 11;
                popups = 12;
            };
        };
        targets.grub.enable = false;
    };
}
