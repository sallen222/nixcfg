{ nixvim, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;

    plugins = {
      lualine.enable = true;
      copilot-vim.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
    };

    plugins.lsp = {
      enable = true;
      servers = { 
	# js / ts
        tsserver.enable = true;
	# nix
	nil_ls.enable = true;
	# yaml
	yamlls.enable = true;
	# markdown
	marksman.enable = true;

      };
    };

    plugins.cmp = {
      enable = true;
      settings.sources = [
        {
          name = "nvim_lsp";
	  groupIndex = 1;
        }
        {
          name = "path";
	  groupIndex = 1;
        }
        {
    	  name = "buffer";
          groupIndex = 2;
        }
      ];
    };

    keymaps = [
      # Telescope
      {
	lua = true;
        action = ''require('telescope.builtin').find_files()'';
	key = "<leader>ff";
      }
      {
	lua = true;
        action = ''require('telescope.builtin').live_grep()'';
	key = "<leader>fg";
      }
      {
	lua = true;
        action = ''require('telescope.builtin').buffers()'';
	key = "<leader>fb";
      }
      {
	lua = true;
        action = ''require('telescope.builtin').help_tags()'';
	key = "<leader>fh";
      }
    ];
  };
}
