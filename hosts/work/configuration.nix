{ config, pkgs, inputs, ... }:
{
  imports = with inputs.self.nixosModules; [
    users-steve
    editor-nvim
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

  system.stateVersion = "23.11";
}
