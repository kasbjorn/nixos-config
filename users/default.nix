{ config, pkgs,  ...}:

{
    
    	users.users.kasbjorn = {
    		isNormalUser = true;
    		description = "Knut Asbjorn";
    		extraGroups = [
          "audio"
          "jackaudio"
          "networkmanager"
          "wheel"
          "docker"
          "libvirtd"
          "lp"
          "scanner"
        ];
			shell = pkgs.zsh;
  	};
}

  
