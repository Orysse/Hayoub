{ hostname, host, ... }:
let 
  inherit (import ./hosts/${host}/options.nix) 
    aLocale aTimezone;
in
{
  imports =
    [
      ./hosts/${host}/hardware.nix
      ./config/system
      ./config/theme
      ./users/users.nix
    ];

  networking.hostName = "${hostname}"; # Define your hostname
  networking.networkmanager.enable = true;

  # Set your time zone
  time.timeZone = "${aTimezone}";

  # Select internationalisation properties
  i18n.defaultLocale = "${aLocale}";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "${aLocale}";
    LC_IDENTIFICATION = "${aLocale}";
    LC_MEASUREMENT = "${aLocale}";
    LC_MONETARY = "${aLocale}";
    LC_NAME = "${aLocale}";
    LC_NUMERIC = "${aLocale}";
    LC_PAPER = "${aLocale}";
    LC_TELEPHONE = "${aLocale}";
    LC_TIME = "${aLocale}";
  };

  console.keyMap = "us";

  # Define a user account.
  users = {
    mutableUsers = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    gc = {
      # automatic = true;
      # dates = "weekly";
      # options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "23.11";
}
