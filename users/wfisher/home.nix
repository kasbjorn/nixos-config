{ config, pkgs, ...}:
{
	imports = [ 
		./modules/ssh
		./modules/fvwm
		./dotfiles 
	];

    home.username = "wfisher";

	home.packages = [
		pkgs.spotify
		pkgs.discord
		pkgs.conky
		pkgs.obsidian
		pkgs.vlc
		pkgs.google-chrome
		pkgs.imagemagick
		pkgs.gh
		pkgs.gimp
		pkgs.gnome-keyring
	];


    	programs.zsh = {
		enable = true;
		enableCompletion = true;
		oh-my-zsh = {
    			enable = true;
    			plugins = [ "git" "thefuck" ];
    			theme = "robbyrussell";
  		};
		shellAliases = {
			update = "sudo nixos-rebuild switch";
			ssh = "kitty +kitten ssh";
			bat = "acpi";
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
