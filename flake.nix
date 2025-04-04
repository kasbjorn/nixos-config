{
  description = "A very basic flake";

  
    nixConfig.extra-substituter = [
      "https://cache.m7.rs"
      "https://nix-community.cachix.org"
    ];
  
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    sops-nix.url = "github:mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    
  };

  outputs = { self, nixpkgs, home-manager, sops-nix, ...} @ inputs:
    let
      inherit(self) outputs;
     
      in {
      
        nixosConfigurations = {

          odin = nixpkgs.lib.nixosSystem {
            modules = [ 
		          ./hosts/odin
              
              sops-nix.nixosModules.sops
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs outputs; };
              }
            ];
   
            specialArgs = { inherit inputs outputs; };
          };
        };
      };
}
