{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=release-24.05";
	home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
	sops-nix.url = "github:Mic92/sops-nix";
  };

	outputs = { self, nixpkgs, home-manager, sops-nix, ... }: {

		nixosConfigurations.odin = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [ 
				./hosts/odin/configuration.nix
				./hosts/odin/hardware-configuration.nix
				./hosts
				sops-nix.nixosModules.sops
				home-manager.nixosModules.home-manager
          		{
            		home-manager.useGlobalPkgs = true;
            		home-manager.useUserPackages = true;					

					home-manager.users.wfisher = import ./users/wfisher/home.nix;
				}
			];
		};
		nixosConfigurations.yggdrasil = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [ 
				./hosts/yggdrasil/configuration.nix
				./hosts/yggdrasil/hardware-configuration.nix
				./hosts
				sops-nix.nixosModules.sops
			];
		};
	};
}

