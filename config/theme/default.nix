{ host, ... }:

 let inherit (import ../../hosts/${host}/options.nix) colorScheme; in
{
    imports = [
        ./fonts.nix
        ./stylix.nix
        ./colorSchemes/${colorScheme}
    ];
}
