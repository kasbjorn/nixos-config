{ pkgs, config, ...}:

{
	home.file = {
      		".config/kitty/nord.conf".source = ./kitty/nord.conf;
      		".emacs.d/init.el".source = ./emacs.d/init.el;
		".emacs.d/config/".source = ./emacs.d/config;
    	};

}


