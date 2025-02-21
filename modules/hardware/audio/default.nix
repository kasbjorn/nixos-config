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
    jack2
    jack_capture
  ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
