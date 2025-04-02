{ inputs, config, pkgs , ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {

    defaultSopsFile = ../secrets.enc.yml;
    validateSopsFiles = false;

    secrets = {
      "ssh_keys" = {
        path = "/home/kasbjornsen/.ssh/id_ed25519";
      };
    };
  };
}
