{
  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];

  opts = {
    number = true;
    relativenumber = true;

    shiftwidth = 2;

    wrap = true;
  };

  globals.mapleader = " ";

  keymaps = [
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
    Comment.fg = "#ff00ff";
    Comment.bg = "#000000";
    Comment.underline = true;
    Comment.bold = true;
  };

  colorschemes.dracula.enable = true;

  plugins = {
    lualine.enable = true;
    lazygit.enable = true;
    gitgutter.enable = true;
    lsp = {
      enable = true;
      servers = {
       lua-ls.enable = true;
       dockerls.enable = true;
       gopls.enable = true;
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
      settings.sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
      ];
      settings.mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = false })";
        "<Tab>" = ''
          cmp.mapping(
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expandable() then
                luasnip.expand()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif check_backspace() then
                fallback()
              else
                fallback()
              end
            end,
            { "i", "s" }
          )
        '';
      };
    };
  };
}
