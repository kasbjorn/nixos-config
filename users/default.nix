{ config, pkgs, ...}:

{
	home-manager.backupFileExtension = "bkp";
    
    	users.users.kasbjorn = {
    		isNormalUser = true;
    		description = "Knut Asbjorn";
    		extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" "lp" config.services.kubo.group];
			shell = pkgs.zsh;
  	};
}
