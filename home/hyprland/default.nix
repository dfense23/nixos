{ config, lib, pkgs, ... }: {
  wayland.windowManager.hyprland = {
  	enable = true;
	extraConfig = ''
	#hyprland.conf here...
	'';
  };
}
