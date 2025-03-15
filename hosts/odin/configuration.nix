# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
    	../../modules/hardware/zram
	    ../../modules/hardware/audio
      ../../modules/virtualization
      ../../modules/tailscale
    ];


  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];

  boot.loader.systemd-boot.enable = true;
      
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "odin";

  networking.networkmanager.enable = true;
  networking.firewall.checkReversePath = "loose";

  services.flatpak.enable = true;

   egnvironment.systemPackages = with pkgs; [
	  git
    wget
    direnv
    tmux
    sshfs
    bash
    killall
    unzip
	  zst
		acpi
    mtp-tools
   ];

  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        enable = true;
        greeters = {
          gtk.enable = true;
        };
      };
    xkb = {
      layout = "us,no";
      options = "grp:win_space_toggle";
    };
  };

  
  programs.niri.enable = true;

  programs.zsh.enable = true;
  
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


  hardware.graphics.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.sensor.iio.enable = true;
	
  services.openssh = {
	  enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}
