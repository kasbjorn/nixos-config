{ inputs, outputs, config, pkgs , ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {

    defaultSopsFile = ../private.yml;
    validateSopsFiles = false;
    age.keyFile = ./keys.txt;
 };
}
