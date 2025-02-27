{ config, pkgs, sops-nix, ...}:
{

  imports = [ 
		./modules/ssh
    ./modules/email
		./dotfiles/default.nix 
	];


	home.username = "kasbjorn";
	home.homeDirectory = "/home/kasbjorn";
	programs.home-manager.enable = true;  


  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  
  home.packages = with pkgs; [
    # System
    blueberry
    
    # General
    age
    mpv
    chromium
    imagemagick
    gh
    gimp
    gnome-keyring
    yt-dlp
    scrot
    
    # Live Code
    supercollider
    supercolliderPlugins.sc3-plugins
    
    # Documents
    pandoc
    
    # ~=~=~+~+~ Coding  ~=~=~+~+

    # Base
   

    # Languages
    guile
    nodejs
    sbcl
    
    # Tools
    nil

    # Clojure Whoredom
    clojure
    leiningen
    clojure-lsp
    
    # Misc
    signal-cli
    obs-studio
    
    # Hyprland
    dunst
    hyprpaper
    hyprcursor
    waybar
    hypridle
    hyprlock
    rofi
    wlogout
    swaylock
    nwg-dock-hyprland

    # Music!! :D
    playerctl
    audacious
    transmission_4-gtk
    
    # Desktop
    nemo

    # Mail
    mu

    # Virtualization
    vagrant
    virt-manager
];

  
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
    };
  };

  programs.java = { 
    enable = true;
  };
  
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages = epkgs: [
      epkgs.vterm
      epkgs.mu4e ];
  };

  programs.zsh = {
	  enable = true;
		enableCompletion = true;
		oh-my-zsh = {
      enable = true;
      plugins = [ "git" "direnv" ];
      theme = "agnoster";
    };
    shellAliases = {
			update = "sudo nixos-rebuild switch";
			bat = "acpi";
		};
    initExtraBeforeCompInit = ''
                            autoload -U add-zsh-hook
                            add-zsh-hook -Uz chpwd (){ print -Pn "\e]2;%2~\a" }
    '';
    
    initExtra  = ''
                vterm_printf() {
                               if [ -n "$TMUX" ] \
                                  && { [ "''${TERM%%-*}" = "tmux" ] \
                       || [ "''${TERM%%-*}" = "screen" ]; }; then
                                     printf "\ePtmux;\e\e]%s\007\e\\" "$1"
                               elif [ "''${TERM%%-*}" = "screen" ]; then
                                    printf "\eP\e]%s\007\e\\" "$1"
                               else
                                    printf "\e]%s\e\\" "$1"
                               fi
                }
   '';
 };
  
  
	programs.gpg.enable = true;

  services.gpg-agent = {
  		enable = true;
  		enableSshSupport = true;
		pinentryPackage = pkgs.pinentry-curses;
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
                                
  home.stateVersion = "24.05";

}
