{ pkgs, config, ... }:

{
  home.packages = [ pkgs.rclone ];

  xdg.configFile."rclone/rclone.conf".text = ''
    [Proton]
      type = protondrive
      username = kasbjornsen@praetor.tel
      password = WzEfCeLkR2K2ilVzerUv2azJEwJOhYpzCfJ_tW31
      client_uid = ibs4rv35kg5s7z277mnmggvjwmgw6f7u
      client_access_token = zeumzqengc42l6g6ozvdnw52k2y26qde
      client_refresh_token = tmrupknsvudkoyfrwic5i4rcygb5z3nz
      client_salted_key_pass = bHdjdDRudlVKZ0RUVVNlZFAzcmUwSmxzbS52aUtvaQ==
    [SDF-MA]
      type = sftp
      host = ma.sdf.org
      user = praetor
      key_file = ~/.ssh/id_ed25519
    [Vault]
      type = crypt
      remote = SDF-MA:/meta/p/praetor/Vault
      filename_encryption = standard
      password ='' ${sops.secrets.secret.vault_password};

  systemd.user.services.proton-mount = {
    Unit = {
      Description = "Proton Mount";
      After = [ "network-online.target" ];
    };
    Service = {
      Type = "notify";
      ExecStart = "${pkgs.rclone}/bin/rclone --vfs-cache-mode writes --ignore-checksum mount Proton: /mnt/proton";
      ExecStop="/bin/fusermount -u /mnt/proton";
    };
    Install.WantedBy = [ "default.target" ];
  };
  systemd.user.services.sdf-ma-mount = {
    Unit = {
      Description = "SDF-MA Mount";
      After = [ "network-online.target" ];
    };
    Service = {
      Type = "notify";
      ExecStart = "${pkgs.rclone}/bin/rclone --vfs-cache-mode writes --ignore-checksum mount SDF-MA:/meta/p/praetor /mnt/sdf-ma";
      ExecStop="/bin/fusermount -u /mnt/proton";
    };
    Install.WantedBy = [ "default.target" ];
  };
}

  
