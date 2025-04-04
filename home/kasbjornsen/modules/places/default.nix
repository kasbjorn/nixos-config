{inputs, pkgs, config, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  system = "x86_64-linux";
  sops = {
    defaultSopsFile = "../../../secrets/private.yml";
  };
  
  home.packages = [ pkgs.rclone ];

  xdg.configFile."rclone/rclone.conf".text = ''
                                           [Proton]
                                           type = protondrive
                                           username = kasbjornsen@praetor.tel
                                           password = ${config.sops.secrets.proton_password}
                                           client_uid = ibs4rv35kg5s7z277mnmggvjwmgw6f7u
                                           client_access_token = zeumzqengc42l6g6ozvdnw52k2y26qde
                                           client_refresh_token = tmrupknsvudkoyfrwic5i4rcygb5z3nz
                                           client_salted_key_pass = bHdjdDRudlVKZ0RUVVNlZFAzcmUwSmxzbS52aUtvaQ==
                                           [SDF-MA]
                                           type = sftp
                                           host = ma.sdf.org
                                           user = praetor
                                           key_file = ~/.ssh/id_ed25519
                                           '';

}

