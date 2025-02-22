{ pkgs, ... }:

{
  programs.mbsync.enable = true;

  programs.msmtp.enable = true;

  programs.notmuch = {
    enable = true;
    hooks = {
      preNew = "mbsync --all";
    };
  };

  accounts.email = {
    accounts.frostbyte = {
      address = "kasbjornsen@frostbyte.works";
      imap.host = "imappro.zoho.com";
      mbsync = {
        enable = true;
        create = "maildir";
      };
      msmtp.enable = true;
      notmuch.enable = true;
      primary = true;
      realName = "Knut Asbjornsen";
      signature = {
        text = ''
          Mit besten Wünschen
          Ben Bals
          https://keybase.io/beb
        '';
        showSignature = "append";
      };
      passwordCommand = "I<3M@ck3y42!!";
      smtp = {
        host = "smtppro.zoho.com";
      };
      userName = "kasbjornsen@frostbyte.works";
    };
  };
}
