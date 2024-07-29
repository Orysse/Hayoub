{ pkgs, config, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List System Programs
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    cmatrix
    neofetch
    btop
    unrar
    libnotify
    wl-clipboard
    lsd
    pkg-config
    meson
    gnumake
    noto-fonts-color-emoji
    ripgrep
    appimage-run
    playerctl
    vim
    tree
    slack
    vault
    cmake
    pavucontrol
    webcord
    wayshot

    firefox
    kitty
  ];

  programs = {
    steam.gamescopeSession.enable = true;
    dconf.enable = true;
    hyprland = {
      enable = true;
      #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
  };

}

