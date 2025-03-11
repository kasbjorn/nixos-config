{ config, pkgs, ... } :
{
  
  services.nginx.enable = false;
  services.tailscale.enable = true;

  services.caddy = {
    enable = true;
    virtualHosts."odin.opossum-bull.ts.net".extraConfig = ''
      handle_path /hello* {
        respond "Hello"
      }
   '';
  };

  services.tailscale.permitCertUid = "caddy";
}
  
