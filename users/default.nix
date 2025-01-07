{ config, pkgs, ...}:

{
	home-manager.backupFileExtension = "bkp";
    
    	users.users.casbjorn = {
    		isNormalUser = true;
    		description = "Canute Asbjorn";
    		extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" "lp" config.services.kubo.group];
			shell = pkgs.zsh;
  	};
}
