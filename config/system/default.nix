{ ... }:
{
  imports = [
    ./amd.nix
    ./grub.nix
    # ./greetd.nix
    ./intel.nix
    ./intel-amd.nix
    ./intel-nvidia.nix
    ./kernel.nix
    ./nh.nix
    ./nvidia.nix
    ./pkgslist.nix
    ./services.nix
    ./sddm.nix
    ./steam.nix
    ./virtualisation
  ];
}
