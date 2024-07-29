{ pkgs, ... }:

{
    stylix.targets.vim.enable = false;
    programs.neovim = {
        plugins = with pkgs.vimPlugins ; [
            everforest
        ];
        extraConfig = ''
            colorscheme everforest
        '';
    };
}
