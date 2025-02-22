{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu
  ];

  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
  ];
  
  virtualisation.docker.enable = true;

  programs.virt-manager.enable = true;

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;
}
