{ pkgs, config, ... }:

{
  nixpkgs.config.insecurePermittedPackages = with pkgs; [
    openssl_1_1
  ];
  
  environment.systemPackages = with pkgs; [
    pkg-config
    gcc
    gnumake
  ];
}
