{ config, pkgs, ...}:
{
	imports = [ 
		./modules/ssh
		./modules/fvwm
		./dotfiles 
	];

    home.username = "wfisher";

	home.packages = [
		pkgs.discord
		pkgs.conky
		pkgs.obsidian
		pkgs.mpv
		pkgs.google-chrome
		pkgs.imagemagick
		pkgs.gh
		pkgs.gimp
		pkgs.gnome-keyring
		pkgs.feh
		pkgs.yt-dlp
		pkgs.audacious
		pkgs.sbcl
		pkgs.scrot
    		pkgs.signal-desktop
	];

	services.emacs = {
    		enable = true;
    		package = pkgs.emacs; # replace with emacs-gtk, or a version provided by the community overlay if desired.
  	};

	programs.emacs = {
		enable = true;
		package = pkgs.emacs;
		extraConfig = ''
			(setq standard-indent 2)
		'';
	};

    	programs.zsh = {
		enable = true;
		enableCompletion = true;
		oh-my-zsh = {
    			enable = true;
    			plugins = [ "git" "direnv" ];
    			theme = "robbyrussell";
  		};
		shellAliases = {
			update = "sudo nixos-rebuild switch";
			ssh = "kitty +kitten ssh";
			bat = "acpi";
			emacs = "emacsclient -c";
		};
	};


	programs.gpg.enable = true;
	services.gpg-agent = {
  		enable = true;
  		enableSshSupport = true;
		pinentryPackage = pkgs.pinentry-curses;
	};

	programs.neovim = {
		enable = true;
		viAlias = true;
  		vimAlias = true;
	};

    	programs.kitty = {
		enable = true;
		settings = {
				font_family = "Inconsolata";
				font_size = "12";
				tab_bar_edge = "top";
				tab_bar_style = "powerline";
				tab_powerline_style = "angled";
				allow_remote_control = "yes";
				shell_integration = "enabled";
				linux_display_server = "x11";

		};
		extraConfig = "include ./nord.conf";
	};

    programs.vscode = {
        enable = true;
    };

	

    home.stateVersion = "24.05";

}
