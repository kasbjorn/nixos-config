{
  description = "A very basic flake";
  
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, sops-nix, ...} @ inputs:
    let

      inherit(self) outputs;
      
      lib = nixpkgs.lib // home-manager.lib;
      
    in {
      inherit lib;
      
      nixosConfigurations = {
     
          odin = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux"; 
            specialArgs = { inherit inputs outputs; };

            modules = [
              ./hosts/odin
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.kasbjornsen = ./home/kasbjornsen/odin.nix;
              } 
            ];
          };
      };
    };
}
    
