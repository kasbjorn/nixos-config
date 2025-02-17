{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    musnix.url = "github:musnix/musnix";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    
  };

	outputs = {nixpkgs, home-manager, sops-nix, ...}:
    {

      nixpkgs.config.allowUnfree = true;
      
      homeConfigurations = {
        "kasjorn" = home-manager.lib.homeManagerConfiguration {
          system = "x86_64-linux";
          homeDirectory = "/home/kasbjorn";
          userName = "kasbjorn";
          configuration.imports = [ ./users/kasbjorn/home.nix ];
        };
      };
    
      nixosConfigurations.odin = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          sops-nix.nixosModules.sops
          ./hosts/odin/configuration.nix
          ./hosts/odin/hardware-configuration.nix
	        ./hosts
        ];
		  };
    };
}

