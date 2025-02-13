{ config, pkgs, ...}:

{
    programs.ssh = {
        enable = true;
        controlMaster = "auto";
        controlPath = "~/.ssh/master-%r@%h:%p";

        matchBlocks = {
            "ma" = {
                hostname = "ma.sdf.org";
                user = "praetor";
                port = 22;
            };
            "team" = {
                hostname = "tilde.team";
                user = "praetor";
                port = 22;
            };
            "book" = {
                hostname = "book";
                user = "u0_a189";
                port = 8022;
            };
        };
    };
}
