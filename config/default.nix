{self, pkgs, ...}: {
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];

  opts = {
    number = true;
    relativenumber = true;

    shiftwidth = 2;
    sts = 2;
    tabstop = 4;

    expandtab = true;
    wrap = true;
  };

  globals.mapleader = " ";

  keymaps = [
    { action = "<cmd>Outline <CR>"; key = "<leader>lS";}
    { action = "<cmd>Telescope live_grep<CR>"; key = "<leader>g";}
    { action = "<cmd>Telescope find_files<CR>"; key = "<leader>ff";}
    { action = "<cmd>Telescope buffers<CR>"; key = "<leader>b";}
    { action = "<cmd>Neotree toggle<CR>"; key = "<leader>e";}
    { action = "<cmd>bnext <CR>"; key = "<S-l>";}
    { action = "<cmd>bprev <CR>"; key = "<S-h>";}
    { action = "<cmd>LazyGit <CR>"; key = "<leader>gg";}
    { action = "<C-w>p"; key = "<C-h>";}
    { action = "<C-w>w"; key = "<C-l>";}
  ];

  highlight = {
    Comment.underline = true;
    Comment.bold = true;
  };

  colorschemes.onedark.enable = true;
  extraPlugins = with pkgs.vimPlugins; [
    {
      plugin = outline-nvim;
      config = ''lua require("outline").setup()'';
    }
  ];

  plugins = {
    lualine.enable = true;
    lazygit.enable = true;
    gitgutter.enable = true;
    lsp-format = {
      enable = true;
      setup = {
        go = {
          force = true;
          order = [
            "efm"
            "gopls"
          ];
          sync = true;
        };
      };
    };
    lsp = {
      enable = true;
      keymaps.lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
      };
      servers = {
       lua-ls.enable = true;
       dockerls.enable = true;
       gopls.enable = true;
       nixd.enable = true;
       pylsp.enable = true;
       marksman.enable = true;
       yamlls.enable = true;
      };
    };

    neo-tree.enable = true;

    telescope.enable = true;

    oil.enable = true;

    treesitter.enable = true;

    luasnip.enable = true;

    which-key.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.snippet = {
         expand = "function(args) require('luasnip').lsp_expand(args.body) end";
      };
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
    };
  };
}
