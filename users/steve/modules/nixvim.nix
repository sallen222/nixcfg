{ nixvim, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;

    plugins = {
      lualine.enable = true;
    };

    plugins.lsp = {
      enable = true;
      servers = { 
	# js / ts
        tsserver.enable = true;
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
  };
}
