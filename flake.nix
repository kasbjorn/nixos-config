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

  outputs = { self, nixpkgs, home-manager, systems, sops-nix, ...} @ inputs:
    let

      inherit(self) outputs;
      systems = [
        "x86_64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;

    in {

      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

      nixosConfigurations = {
     
          odin = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux"; 
            specialArgs = { inherit inputs outputs; };

            modules = [
              ./hosts/odin
            ]; 
          };
      };

      homeConfigurations = {
        "kasbjornsen@odin" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home
          ];
        };
      };
    };
}
    
