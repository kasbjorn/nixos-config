{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    libjack2
    jack2
    qjackctl
    pavucontrol
    libjack2
    jack2
    qjackctl
    jack2Full
    jack_capture
  ];

  musnix.enable = true;
}
