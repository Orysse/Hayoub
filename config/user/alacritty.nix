{ pkgs, config, ... }:

{
  programs.alacritty.enable = true;
  /* programs.alacritty.settings = {
    font = {
      normal = {
        family = "IosevkaTerm Nerd Font";
        style = "Bold";
      };
      size = 12.0;
    };
    window.opacity = 0.9;
    env.TERM = "xterm-256color";
  }; */
}
