{ config, pkgs, ...}:

{
  home.file.".ssh/id_ed25519" = ${sops.secrets.secret.ssh_keys;
  
    programs.ssh = {
        enable = true;
        controlMaster = "auto";
        controlPath = "~/.ssh/master-%r@%h:%p";

        matchBlocks = {
            "sdf" = {
                hostname = "ma.sdf.org";
                user = "praetor";
                port = 22;
            };
            "team" = {
                hostname = "tilde.team";
                user = "praetor";
                port = 22;
            };
            "envs" = {
              hostname = "envs.sh";
              user = "praetor";
              port = 22;
            };
            "book" = {
                hostname = "book";
                user = "u0_a192";
                port = 8022;
            };
        };
    };
}
