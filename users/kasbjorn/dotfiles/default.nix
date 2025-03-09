{ pkgs, config, ...}:

{
	home.file = {
      		".config/alacritty".source = ./alacritty;
      		".emacs.d/init.el".source = ./emacs.d/init.el;
		      ".emacs.d/config".source = ./emacs.d/config;
		      ".emacs.d/snippets".source = ./emacs.d/snippets;
          ".wallpaper".source = ./wallpaper;
          ".config/niri".source = ./niri;
          ".config/wpaperd".source = ./wpaperd;
          ".config/nyxt".source = ./nyxt;
          
    	};

}


