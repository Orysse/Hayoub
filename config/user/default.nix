{ pkgs, ... }:

{
    imports = [
      ./alacritty.nix
      # ./communication
      ./editor
      ./hyprland/hyprland.nix
      ./menu
      ./nvim/nvim.nix
      ./shell
      ./notify/mako.nix
    ];
}
