{ pkgs, inputs, host, ... }:
let
  finecmdline = pkgs.vimUtils.buildVimPlugin {
    name = "fine-cmdline";
    src = inputs.fine-cmdline;
  };
  inherit (import ../../../hosts/${host}/options.nix) colorScheme;
in
{
  imports = [ ../../theme/colorSchemes/${colorScheme}/vim.nix ];
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
      extraPackages = with pkgs; [
        lua-language-server
        gopls
        xclip
        wl-clipboard
        luajitPackages.lua-lsp
        nil
        rust-analyzer
        nodePackages.bash-language-server
        yaml-language-server
        pyright
        marksman
        terraform-ls
        tflint
      ];
      plugins = with pkgs.vimPlugins; [
        alpha-nvim
        bufferline-nvim
        dressing-nvim
        indent-blankline-nvim
        nui-nvim
        finecmdline
        nvim-treesitter.withAllGrammars
        lualine-nvim
        nvim-autopairs
        nvim-web-devicons
        nvim-cmp
        nvim-surround
        nvim-lspconfig
        cmp-nvim-lsp
        cmp-buffer
        luasnip
        cmp_luasnip
        friendly-snippets
        lspkind-nvim
        comment-nvim
        nvim-ts-context-commentstring
        oil-nvim
        plenary-nvim
        neodev-nvim
        luasnip
        telescope-nvim
        todo-comments-nvim
        nvim-tree-lua
        telescope-fzf-native-nvim
        vim-tmux-navigator
        nvim-notify
      ];
      extraConfig = ''
        set noemoji
        nnoremap : <cmd>FineCmdline<CR>
      '';
      extraLuaConfig = ''
        ${builtins.readFile ./nvim/set.lua}
        ${builtins.readFile ./nvim/remap.lua}
        ${builtins.readFile ./nvim/plugins/alpha.lua}
        ${builtins.readFile ./nvim/plugins/autopairs.lua}
        ${builtins.readFile ./nvim/plugins/bufferline.lua}
        ${builtins.readFile ./nvim/plugins/cmp.lua}
        ${builtins.readFile ./nvim/plugins/comment.lua}
        ${builtins.readFile ./nvim/plugins/fine-cmdline.lua}
        ${builtins.readFile ./nvim/plugins/lualine.lua}
        ${builtins.readFile ./nvim/plugins/lsp.lua}
        ${builtins.readFile ./nvim/plugins/notify.lua}
        ${builtins.readFile ./nvim/plugins/oil.lua}
        ${builtins.readFile ./nvim/plugins/telescope.lua}
        ${builtins.readFile ./nvim/plugins/treesitter.lua}
        require("ibl").setup()
      '';
    };
  };
}


