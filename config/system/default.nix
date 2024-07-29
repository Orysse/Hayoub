{ config, pkgs, ... }:

{
  imports = [
    ./amd.nix
    ./default-kernel.nix
    ./grub.nix
    ./intel.nix
    ./intel-amd.nix
    ./intel-nvidia.nix
    ./nh.nix
    ./nvidia.nix
    ./pkgslist.nix
    ./services.nix
    ./sddm.nix
    ./steam.nix
    ./virtualisation
  ];
}
