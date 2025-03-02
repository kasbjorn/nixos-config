{ pkgs, config, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    plugins = [
      pkgs.hyprlandPlugins.hyprscroller
    ];
  };
}
