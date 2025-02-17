{ config, pkgs,  ...}:

{
    
    	users.users.kasbjorn = {
    		isNormalUser = true;
    		description = "Knut Asbjorn";
    		extraGroups = [ "audio" "jackaudio" "networkmanager" "wheel" "docker" "libvirt" "lp" "scanner" config.services.kubo.group];
			shell = pkgs.zsh;
  	};
}

  
