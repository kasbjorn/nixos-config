{ config, pkgs, lib, ...}:
let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {

  users.users.kasbjornsen = {
    isNormalUser = true;
    description = "Knut Asbjornsen";
    shell = pkgs.zsh;
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

  security.pam.services = {
    swaylock = {};
 };
}
