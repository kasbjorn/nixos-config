{ config, pkgs,  ...}:

{

  imports = [
    
  ];

  users.users.kasbjornsen = {
    isNormalUser = true;
    description = "Knut Asbjornsen";
    extraGroups = [
      "audio"
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
    ];

    packages = [ pkgs.home-manager
                 pkgs.sops ];
  };

  home-manager.users.kasbjornsen = import ./kasbjornsen/${config.networking.hostName}.nix;
}

  
