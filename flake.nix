{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    musnix.url = "github:musnix/musnix";
    sops-nix.url = "github:Mic92/sops-nix";
    
  };

	outputs = inputs: rec {

      nixpkgs.config.allowUnfree = true;
      
      homeConfigurations = {
        "kasjornsen" = inputs."home-manager".lib.homeManagerConfiguration {
          system = "x86_64-linux";
          homeDirectory = "/home/kasbjornsen";
          userName = "kasbjornsen";
          configuration.imports = [ ./users/kasbjornsen/home.nix ];
        };
        specialArgs = { inherit inputs; };
      };
    
      nixosConfigurations = {
        odin = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            inputs.sops-nix.nixosModules.sops
            inputs.musnix.nixosModules.musnix
            ./hosts
            ./hosts/odin/configuration.nix
            ./hosts/odin/hardware-configuration.nix
	          ./users
          ];
          specialArgs = { inherit inputs; };
		    };
      };
    };
}

