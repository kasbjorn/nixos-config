{ inputs, config, pkgs , ... }:

{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];
  
  sops = {

    defaultSopsFile = ./private.yml;
    validateSopsFiles = false;
    age.keyFile = /home/kasbjornsen/.config/sops/age/keys.txt;
 };
}
