{ inputs, config, pkgs}:

{
  imports = [inputs.sops-nix.nixosModules.sops];
  
  sops = {
    defaultSopsFile = ./private.yml;
    validateSopsFiles = false;
    age.keyFile = /home/kasbjornsen/.config/sops/age/keys.txt;
  };

  password = config.sops.secret."kasbjornsen".path;
  ${password};
}
