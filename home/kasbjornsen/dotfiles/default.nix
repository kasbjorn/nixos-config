{ inputs,outputs, lib, pkgs, config, ...}:

{
	home.file = {
      		".config/alacritty".source = ./alacritty;
      		".emacs.d/init.el"  =
            {
              source = config.lib.file.mkOutOfStoreSymlink ./emacs.d/init.el;
            };
          ".emacs.d/snippets" =
            {
              source = config.lib.file.mkOutOfStoreSymlink ./emacs.d/snippets;
            };
	        ".emacs.d/config".source = ./emacs.d/config;
          ".emacs.d/feeds.org".source = ./emacs.d/feeds.org;
          ".wallpaper".source = ./wallpaper;
          ".config/niri".source = ./niri;
          ".config/wpaperd".source = ./wpaperd;
          ".config/nyxt".source = ./nyxt;
          ".config/waybar".source = ./waybar;
          ".config/gammastep".source = ./gammastep;
          ".local/share/fonts".source = ./fonts;
    	};

}


