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

    packages = [ pkgs.sops ];
  };
}

  
