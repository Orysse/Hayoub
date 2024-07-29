{ pkgs, ... }:

{
    stylix.targets.vim.enable = false;
    programs.neovim = {
        plugins = with pkgs.vimPlugins ; [
            rose-pine
        ];
        extraConfig = ''
            colorscheme rose-pine
        '';
    };
}
