# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{  pkgs, libs, config, ... }:

{
  imports =
    [
    	./hardware-configuration.nix
      ./persistence.nix
      ./services

      
      ../common/users
 
      
	    ../../modules/hardware/zram
	    ../../modules/hardware/audio
      ../../modules/tailscale
      ../../modules/virtualization
    ];
  
  
  boot.loader.systemd-boot.enable = true;
      
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "odin";

  networking.networkmanager.enable = true;
  networking.firewall.checkReversePath = "loose";
  
  time.timeZone = "America/Chicago";

  programs.niri.enable = true;

  programs.xwayland.enable = true;

  services.libinput = {
    touchpad = {
      disableWhileTyping = true;
      naturalScrolling = true;
    };
  };

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    displayManager = {
	lightdm =
      	{
        	enable = true;
        	greeters.gtk.enable = true;
      	};
    };    
  };
  
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.gnome = {
    gnome-keyring = {
      enable = true;
    };
  };

  hardware.graphics.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.sensor.iio.enable = true;

  xdg.portal.enable = true;
  
  services.flatpak.enable = true;
  services.gvfs.enable = true;
  services.openssh.enable = true;
  
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}
