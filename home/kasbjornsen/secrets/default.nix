{ inputs,config, pkgs, lib, ...}:
{
  sops = {
    age.keyFile = "/home/kasbjornsen/.config/sops/age/keys.txt"; # must have no password!
   
    defaultSopsFile = ./secrets.yaml;

    defaultSymlinkPath = "/run/user/1000/secrets";
    defaultSecretsMountPoint = "/run/user/1000/secrets.d";
  };

  sops.secrets."big_secret" = {
    format = "yaml";
    sopsFile = ./secrets.yaml;
  };
}
