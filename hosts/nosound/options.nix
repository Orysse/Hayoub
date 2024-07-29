let
  setUsername = "lenny";
  setHostname = "nosound";
in
{
  username = "${setUsername}";
  hostname = "${setHostname}";
  userHome = "/home/${setUsername}";

  gitUsername = "Lenny Chiadmi-Delage";
  gitEmail = "lenny.chiadmi@gmail.com";

  clock24h = false;
  aLocale = "en_US.UTF-8";
  XkbLayout = "fr";
  XkbVariant = "";
  aTimezone = "Europe/Paris";

  gpuType = "intel";


}
