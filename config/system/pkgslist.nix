{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List System Programs
  environment.systemPackages = with pkgs; [
    #Get things online
    wget
    curl
    git

    #Build tools
    cmake
    pkg-config
    meson
    appimage-run
    gnumake

    #Useful bin
    wl-clipboard
    libnotify
    playerctl
    unrar

    #Nix package bullshit
    nix-prefetch-git
    fd

    #Terminal utils
    btop
    lsd
    neofetch
    tree
    ripgrep
    vim

    #User apps
    firefox
    pavucontrol
    slack
    vault
    webcord
    wayshot

    #Kube
    k3d
    kind
    kubectl
    kubernetes-helm
    terraform

    # ?
    noto-fonts-color-emoji
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

