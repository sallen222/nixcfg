{ config, lib, pkgs, inputs, ... }:
{
  home = {
    username = "steve";
    homeDirectory = "/home/steve";
    packages = with pkgs; [
      vim
    ];
  };
  
  home.stateVersion = "20.03";    
}
