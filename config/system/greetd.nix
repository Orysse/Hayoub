{ pkgs, host, ... }:
let inherit (import ../../hosts/${host}/options.nix) username; in
{
    services.greetd = {
      enable = true;
      vt = 3;
      settings = {
        default_session = {
          user = "${username}";
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        };
      };
    };
}
