{
  home-manager.users.steve = { pkgs, ... }: {
    programs.neovim = {
      enable = true;
    };
  };
}
