{ inputs, config, pkgs, ...}:

{
  imports = [inputs.sops-nix.nixosModules.sops];
  
 # sops = {
 #   defaultSopsFile = ../../secrets/private.yml;
 #   validateSopsFiles = false;
 #   age.keyFile = /home/kasbjornsen/.config/sops/age/keys.txt;
 #};
  
  users.groups.kasbjornsen = {};
  
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
      "users"
    ];

    packages = [pkgs.home-manager];
  };
  
  programs.zsh.enable = true;
  
}
