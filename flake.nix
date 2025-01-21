{
  description = "A very basic flake";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable";};
    home-manager = { url = "github:nix-community/home-manager";};
    sops-nix  = { url = "github:Mic92/sops-nix";};
    musnix  = { url = "github:musnix/musnix";};
  };

	outputs = { self, nixpkgs, home-manager, sops-nix, musnix, ... }: {

		nixosConfigurations.odin = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [ 
				./hosts/odin/configuration.nix
				./hosts/odin/hardware-configuration.nix
				./hosts
				musnix.nixosModules.musnix
				sops-nix.nixosModules.sops
				home-manager.nixosModules.home-manager
          		{
            		home-manager.useGlobalPkgs = true;
            		home-manager.useUserPackages = true;					

					home-manager.users.kasbjorn = import ./users/kasbjorn/home.nix;
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

