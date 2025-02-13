{ config, pkgs,  ...}:

{
    
    	users.users.kasbjorn = {
    		isNormalUser = true;
    		description = "Knut Asbjorn";
    		extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" "lp" "scanner" config.services.kubo.group];
			shell = pkgs.zsh;
  	};
}

  
