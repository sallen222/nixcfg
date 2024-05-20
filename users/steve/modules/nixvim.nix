{ nixvim, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;
    extraPackages = with pkgs;
      [
        ripgrep
      ];

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
        action = ''<cmd>lua require('telescope.builtin').find_files()<cr>'';
	key = "<leader>ff";
      }
      {
        action = ''<cmd>lua require('telescope.builtin').live_grep()<cr>'';
	key = "<leader>fg";
      }
      {
        action = ''<cmd>lua require('telescope.builtin').buffers()<cr>'';
	key = "<leader>fb";
      }
      {
        action = ''<cmd>lua require('telescope.builtin').help_tags()<cr>'';
	key = "<leader>fh";
      }
    ];
  };
}
