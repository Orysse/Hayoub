{ pkgs, ... }:

{
    stylix.targets.vim.enable = false;
    programs.neovim = {
        plugins = with pkgs.vimPlugins ; [
            gruvbox
        ];
        extraConfig = ''
            colorscheme gruvbox
        '';
    };
}
