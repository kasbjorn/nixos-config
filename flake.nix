{
  description = "A very basic flake";

  nixConfig = {
    extra-substituter = [
      "https://cache.m7.rs"
      "https://nix-community.cachix.org"
    ];
  };
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";
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

  outputs = { self, nixpkgs, home-manager, systems, ...} @ inputs:
    let
      inherit(self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs (import systems) (
        system:
        import nixpkgs {
          inherit system;
          config.allowUnFree = true;
        }
      );
    in {

      inherit lib;

      nixosConfigurations = {

        odin = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/odin ];
          specialArgs = {
	  	      inherit inputs outputs;
          };
        };
      };
   
      homeConfigurations = {
        "kasbjornsen@odin" = lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;
          modules = [ ./users/kasbjornsen/odin.nix ];
	        extraSpecialArgs = {
		        inherit inputs outputs;
          };
        };
      };
    };
}

