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
    imagemagick
    gh
    gimp
    gnome-keyring
    yt-dlp
    scrot
    chromium
    
    # Live Code
    supercollider
    supercolliderPlugins.sc3-plugins
    
    # Documents
    pandoc
    
    # ~=~=~+~+~ Coding  ~=~=~+~+

    # Base
    pkg-config
    gcc
    gnumake

    # Languages
    guile
    nodejs
    sbcl
    ruby

    # Libraries
    openssl
    openssl.dev
    openssl.out
    
    # Tools
    nil

    # Clojure Whoredom
    clojure
    leiningen
    clojure-lsp
    
    # Misc
    signal-cli
    obs-studio
    
    # Niri / WM
    mako
    waybar
    rofi
    swaylock
    yazi
    swaybg

    # General X
    wl-clipboard-x11
    wl-clipboard
    xwayland-satellite
    
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
 
  programs.java = { 
    enable = true;
  };
  
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages = epkgs: [
      epkgs.vterm
      epkgs.mu4e
      epkgs.ement
   ];
  };
 
  services.emacs = {
	  enable = true;
	  package = pkgs.emacs;
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
      copy = "echo file://`realpath $1` | wl-copy -t text/uri-list";
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

  programs.alacritty = {
	  enable = true;
	};
                                
  home.stateVersion = "24.05";

}
