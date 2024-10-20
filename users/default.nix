{ config, pkgs, ...}:

{
    users.users.wfisher = {
    	isNormalUser = true;
    	description = "Wes Fisher";
    	extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" config.services.kubo.group];
		shell = pkgs.zsh;
  	};
}