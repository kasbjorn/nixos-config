# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
    	../../modules/hardware/zram
	    ../../modules/hardware/audio
    ];

  environment.systemPackages = with pkgs; [
  ];

  boot.loader.systemd-boot.enable = true;
      
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "odin";

  networking.networkmanager.enable = true;
  networking.firewall.checkReversePath = "loose";
  
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };

  programs.iio-hyprland = {
    enable = true;
  };

  services.greetd = {
  	enable = true;
  	settings = rec {
    		initial_session = {
      		command = "${pkgs.hyprland}/bin/Hyprland";
      		user = "kasbjorn";
    	};
    	default_session = initial_session;
  	};
};

  time.timeZone = "America/Chicago";

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


  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.sensor.iio.enable = true;
  
  services.blueman.enable = true;

  services.tailscale.enable = true;
	
  services.openssh = {
	  enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}
