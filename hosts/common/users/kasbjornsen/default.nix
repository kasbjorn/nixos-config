{ config, pkgs,  ...}:
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

  home-manager.users.kasbjornsen = import [ ./kasbjornsen/${config.networking.hostName}.nix;

  security.pam.services = {
    swaylock = {};
 };
}