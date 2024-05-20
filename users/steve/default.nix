{ config, lib, pkgs, inputs, nixvim, ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/nixvim.nix
  ];
  home = {
    username = "steve";
    homeDirectory = "/home/steve";
    packages = with pkgs; [
      vim
    ];
    
  };
   
  home.stateVersion = "20.03";    
}
