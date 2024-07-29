{
  pkgs,
  username,
  host,
  ...
}:
let
  inherit (import ./../../hosts/${host}/options.nix) gitUsername gitEmail theme;
in
{
  # Home Manager Settings
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11";
  # Import Program Configurations
  imports = [
    ../../config/user
  ];
  # Place Files Inside Home Directory
  home.file."Pictures/Wallpapers" = {
    source = ../../config/theme/wallpapers;
    recursive = true;
  };
  # Install & Configure Git
  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
  };
  # Create XDG Dirs
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
  programs = {
    btop = {
      enable = true;
      settings = {
        vim_keys = true;
      };
    };
  home-manager.enable = true;
  };
}
