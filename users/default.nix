{ config, pkgs,  ...}:

{

  imports = [
    
  ];

  users.users.kasbjornsen = {
    isNormalUser = true;
    description = "Knut Asbjornsen";
    extraGroups = [
      "audio"
      "jackaudio"
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
      "lp"
      "scanner"
    ];

    shell = pkgs.zsh;
  };
}

  
