{ inputs, outputs, config, pkgs , ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {

    defaultSopsFile = ./private.enc.yml;
    validateSopsFiles = false;
    age.keyFile = "";
 };
}
