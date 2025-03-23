{ config, pkgs, ...}:

{
  musnix.enable = true;

  environment.systemPackages = with pkgs; [ pavucontrol libjack2 jack2 qjackctl  jack_capture ];
  
  services.pipewire ={
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
