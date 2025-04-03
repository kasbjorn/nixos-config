{ config, pkgs, lib, ...}:
let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {

  users.users.kasbjornsen = {
    isNormalUser = true;
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
