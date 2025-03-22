{ pkgs, config, ... }:

{
  
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
