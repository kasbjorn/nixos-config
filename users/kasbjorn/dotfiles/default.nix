{ pkgs, config, ...}:

{
	home.file = {
      		".config/alacritty".source = ./alacritty;
      		".emacs.d".source = ./emacs.d;
          ".wallpaper".source = ./wallpaper;
          ".config/hypr".source = ./hyprland;
          
    	};

}


