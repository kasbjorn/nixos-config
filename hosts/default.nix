{ inputs, config, pkgs , ... }:

{
  imports = [
    inputs.sops-nixosModules.sops
  ];
  
  sops = {
    defaultSopsFile = ./common/secrets/private.yml;
    validateSopsFiles = false;
    age.keyFile = /home/kasbjornsen/.config/sops/age/keys.txt;
 };
}
