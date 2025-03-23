{ config, pkgs, ...}:

{
  musnix.enable = true;
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;s
    jack.enable = true;
  };
}
