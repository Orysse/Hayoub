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
  XkbLayout = "us";
  XkbVariant = "intl";
  aTimezone = "Europe/Paris";

  gpuType = "intel";

  colorScheme = "dracula";
}
