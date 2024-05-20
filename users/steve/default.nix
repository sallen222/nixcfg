{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./modules/zsh.nix
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
