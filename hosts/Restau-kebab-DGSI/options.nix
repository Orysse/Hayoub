let
  setUsername = "abelc";
  setHostname = "Restau-kebab-DGSI";
in
{
  username = "${setUsername}";
  hostname = "${setHostname}";
  userHome = "/home/${setUsername}";

  gitUsername = "Abel Chartier";
  gitEmail = "abel.chartier@gmail.com";

  clock24h = false;
  aLocale = "en_US.UTF-8";
  kbLayout = "us";
  kbVariant = "intl";
  aTimezone = "Europe/Paris";

  gpuType = "intel-nvidia";
  intel-bus-id = "PCI:0:2:0";
  nvidia-bus-id = "PCI:1:0:0";

  colorScheme = "dracula";
}
