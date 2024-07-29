let
  setUsername = "defaultuser";
  setHostname = "nixos";
in
{
  username = "${setUsername}";
  hostname = "${setHostname}";
  userHome = "/home/${setUsername}";

  gitUsername = "Abel Chartier";
  gitEmail = "abel.chartier@gmail.com";

  clock24h = false;
  aLocale = "en_US.UTF-8";
  XkbLayout = "us";
  XkbVariant = "";
  aTimezone = "Asia/Jakarta";

  gpuType = "intel-nvidia";

  intel-bus-id = "PCI:0:2:0";
  nvidia-bus-id = "PCI:0:2:0";

}
