{ pkgs, config, ...}:

{
	home.file = {
      		".config/alacritty".source = ./alacritty;
      		".emacs.d/init.el".source = ./emacs.d/init.el;
		      ".emacs.d/config/".source = ./emacs.d/config;
          ".wallpaper".source = ./wallpaper;
          ".config/hypr".source = ./hyprland;
          
    	};

}


