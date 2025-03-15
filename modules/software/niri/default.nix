{ pkgs, lib, config, ...}:
with pkgs;
let
  cfg = config.programs.niri;
in {

   options.programs.niri = {
	enable = mkEnableOption "Niri";
	xwayland = mkEnableOption "xwayland-satellite";
   };

   config = mkIf cfg.enable {
	programs.niri.enable = true;
   };
};

