{ pkgs, ... }:

{
  home.packages = with pkgs; [
    protonmail-bridge
  ];
  
  programs.mbsync.enable = true;

  programs.msmtp.enable = true;

  programs.notmuch = {
    enable = true;
    hooks = {
      preNew = "mbsync --all";
    };
  };

  systemd.user.services.protonmail-bridge = {
    Unit = {
      Description = "protonmail-bridge services";
      After = [ "network.target" ];
    };
    Install = {
      WantedBy = [ "multi-user.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "/home/kasbjornsen/.local/bin/protonmail.sh start";
      ExecStop = "/home/kasbjornsen/.local/bin/protonmai.sh stop";
    };
  };
  
  accounts.email = {
    accounts.praetortel = {
      address = "kasbjornsen@praetor.tel";
      imap.host = "127.0.0.1";
      imap.port = 1143;
      imap.tls.enable  = false;
      mbsync = {
        enable = true;
        create = "maildir";
      };
      msmtp.enable = true;
      notmuch.enable = true;
      primary = true;
      realName = "Knut Asbjornsen";
      signature = {
        text = '' I da hoe'';
        showSignature = "append";
      };
      passwordCommand = "cat ~/.insecure-password";

      smtp = {
        host = "127.0.0.1";
        port= 1024;
        tls.enable = true;
      };

      userName = "kasbjornsen@praetor.tel";
    };
  };
}
