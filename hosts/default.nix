{ pkgs, config, ...}:
{
	
	imports = [
        	../modules/virtualization
        	../users
    	];

	services.ipp-usb.enable = true;

	hardware.sane = {
		      enable = true;
		      extraBackends = [ pkgs.hplipWithPlugin ];
		      

     	environment.systemPackages = with pkgs; [
 				   vim
	    			   git
		    		   wget
        			   direnv
        			   tmux
        			   sshfs
        			   bash
        			   killall
        			   unzip
				   zstd
		    		   acpi
		    		   alsa-utils
				   simple-scan
	    ];

    programs.zsh.enable = true;
}
