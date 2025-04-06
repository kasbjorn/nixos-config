{inputs, config, pkgs, ...}:

{

  imports = [ 
    ./modules/fonts
	  ./modules/ssh
    ./modules/email
    ./dotfiles
    ./modules/places
    ./secrets

  ];
  
	programs.home-manager.enable = true;

  home = {
    username = "kasbjornsen";
    homeDirectory = "/home/kasbjornsen";
    sessionPath = ["$HOME/.local/bin"];
  };

  home.packages = with pkgs; [
    # System
    blueberry
    
    # Crypto
    age
    sops
    
    # General 
    mpv
    imagemagick
    gh
    gimp
    pass
    yt-dlp
    scrot
    google-chrome
    nyxt
    rclone
    tmux

    # Live Code
    supercollider
    supercolliderPlugins.sc3-plugins
    
    # Documents
    pandoc
    
    # ~=~=~+~+~ Coding  ~=~=~+~+


    # Languages
    guile
    sbcl
    ruby

    # Rust
    rustc
    cargo

    # Libraries
    openssl
    openssl.dev
    openssl.out
    
    # Tools
    nil
    devenv
    direnv

    # Clojure Whoredom
    clojure
    leiningen
    clojure-lsp

    # Misc
    signal-cli
    calibre

    # Video
    obs-studio
    
    # Niri / WM
    mako
    waybar
    rofi
    swaylock
    yazi
    wpaperd
    stumpwm
    niri

    # General X
    wl-clipboard-x11
    wl-clipboard
    xwayland-satellite
    
    # Music!! :D
    spotify
    playerctl
    audacious
    transmission_4-gtk
    
    # Desktop
    tigervnc

    # Mail
    mu
    protonmail-bridge

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
    sessionVariables = {
      XDG_CURRENT_DESKTOP="niri";
      WAYLAND_DISPLAY="wayland-0";
      QT_QPA_PLATFORM="xcb";
      QT_QPA_PLATFORMTHEME="qt5ct";
    };
    shellAliases = {
			update = "sudo nixos-rebuild switch";
			bat = "acpi";
      copy = "echo file://`realpath $1` | wl-copy -t text/uri-list";
		};
    enableVteIntegration = true;
 };
  
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 32.0;
    longitude = -99.0;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
    };
        
  };
  
	programs.gpg.enable = true;

  services.gpg-agent = {
  		enable = true;
  		enableSshSupport = true;
		pinentryPackage = pkgs.pinentry-curses;
	};

  programs.git = {
    enable = true;
    userName = "Knut Asbjorjsen";
    userEmail = "kasbjornsen@praetor.tel";
    extraConfig = {
      init.defaultBranch = "main";
      user.signingkey = "37E798C7D6FE114C";
      commit.gpgsign = true;
      tag.gpgSign = true;
    };
  };
  
  programs.alacritty = {
	  enable = true;
	};
                                
  home.stateVersion = "24.05";

}
