{ config, pkgs, ...}:

{
  imports = [ ../../secrets ];
  
  users.groups.kasbjornsen = {};
  
  users.users.kasbjornsen = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.kasbjornsen.path;
    description = "Knut Asbjornsen";
    shell = pkgs.zsh;
    group = "kasbjornsen";
    extraGroups = [
      "audio"
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
    ];

    packages = [pkgs.home-manager];
  };
  
  programs.zsh.enable = true;

  home-manager.users.kasbjornsen = ../../../../users/kasbjornsen/${config.networking.hostName}.nix;
  
}
