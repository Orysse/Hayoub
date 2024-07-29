{
  pkgs, 
  ... 
}:

{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "IosevkaTerm" "Iosevka" ]; })
    rounded-mgenplus
    noto-fonts
  ];
}
