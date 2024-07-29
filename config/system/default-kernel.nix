{ config, lib, pkgs, host, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages;
}

