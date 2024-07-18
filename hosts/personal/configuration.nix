{ config, pkgs, inputs, ... }:
{
  imports = with inputs.self.nixosModules; [
    users-steve
  ];
  
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = import "${inputs.self}/users";
    extraSpecialArgs = {
      inherit inputs;
    };
  };

  time.timeZone = "America/Philadelphia";
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    wget
    vim
    git
  ];
  
  programs.zsh.enable = true;

  system.stateVersion = "24.05";
}
