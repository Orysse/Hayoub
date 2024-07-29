{ pkgs, ... }:

{
    stylix.targets.vim.enable = false;
    programs.neovim = {
        plugins = with pkgs.vimPlugins ; [
            dracula-nvim
        ];
        extraConfig = ''
            colorscheme dracula
        '';
    };
}
