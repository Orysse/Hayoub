{ pkgs, host, ... }:

let inherit (import ../../hosts/${host}/options.nix) kbVariant kbLayout ;
in
{
  services.xserver = {
    enable = false;
    xkb = {
      variant = "${kbVariant}";
      layout = "${kbLayout}";
    };
  };

  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    wayland.enable = true;
    theme = "${import ../packages/sddm-theme.nix { inherit pkgs; }}";
  };

  services.libinput.enable = true;

   environment.systemPackages = [ 
    pkgs.libsForQt5.qt5.qtgraphicaleffects
    pkgs.libsForQt5.qt5.qtquickcontrols
  ]; 
}
