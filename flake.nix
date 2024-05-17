{
  description = "Steve's NixOS config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };
  outputs = 
    { self
    , home-manager 
    , nixos-wsl
    , nixpkgs
    , ...
    } @ inputs: {
    nixosModules = import ./modules { lib = nixpkgs.lib; };
    nixosConfigurations = {
      work = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/work/configuration.nix
          home-manager.nixosModules.home-manager
          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "23.11";
            wsl.enable = true; 
          }
        ]; 
        specialArgs = { inherit inputs; };
      };
    };
  };
}
