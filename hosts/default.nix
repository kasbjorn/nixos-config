{ pkgs, config, ... }:

{

  nix.settings.trusted-users = [ "root" "kasbjornsen" ];
  
  nixpkgs.config.insecurePermittedPackages = [
	
  ];

  
 
  environment.systemPackages = with pkgs; [
    pkg-config
    gcc
    gnumake

    openssl
    openssl.dev
    openssl.out
  ];
}
