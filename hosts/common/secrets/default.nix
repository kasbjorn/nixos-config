{ inputs, config, pkgs , ... }:

{
  imports = [inputs.sops-nix.nixosModules.sops];
  
  sops = {
    defaultSopsFile = ./private.yml;
    validateSopsFiles = false;
 };
}
