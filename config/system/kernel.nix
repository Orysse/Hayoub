{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages;
    kernelParams = [ "v4l2loopback" ];
    loader.timeout = null;
    # initrd.verbose = false;
    # initrd.systemd.enable = true;
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    # Needed For Some Steam Games
    kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };
    loader.efi.canTouchEfiVariables = true;
    loader.efi.efiSysMountPoint = "/boot";
    # plymouth.enable = true;
  };
  systemd.watchdog.rebootTime = "0";
}

