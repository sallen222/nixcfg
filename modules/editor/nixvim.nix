{ nixvim, pkgs, ... }:

{
  home-manager.users.steve = { pkgs, ... }: {
    programs.nixvim = {
      enable = true;
      colorschemes.gruvbox.enable = true;
    };
  };
}
