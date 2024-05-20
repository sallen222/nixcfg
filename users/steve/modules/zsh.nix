{ config, pkgs, self, inputs, ... }:

{
  programs.zsh = {
   enable = true;
   shellAliases = {};

  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "gallifrey";
  }; 
}
