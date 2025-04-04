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

    in {

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
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/kasbjorsen/odin.nix];
      };
     };
    };
}
    
