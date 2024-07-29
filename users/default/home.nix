{
  pkgs,
  username,
  host,
  ...
}:
let
  inherit (import ./../../hosts/${host}/options.nix) gitUsername gitEmail;
in
{
  # Home Manager Settings
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11";
  # Import Program Configurations
  imports = [
    ../../config/hyprland.nix
    ../../config/neovim.nix
    ../../config/alacritty.nix
  ];
  # Place Files Inside Home Directory
  home.file."Pictures/Wallpapers" = {
    source = ../config/wallpapers;
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
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  qt = {
    enable = true;
    style.name = "adwaita-dark";
    platformTheme.name = "gtk3";
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
