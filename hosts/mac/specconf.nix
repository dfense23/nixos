# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
# Error regarding boot.kernelPackages being defined twice, potentially from nixos.hardware
# boot.kernelPackages = pkgs.linuxPackages_latest; # for latest kernel
  networking.hostName = "mac"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  time.hardwareClockInLocalTime = true;

  ##networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  home-manager.extraSpecialArgs = {
    vars = {
      desktop = true;
    };
  };

# Enable sound.
  sound.enable = true;

  hardware.pulseaudio = { 
	  support32Bit = true;
	  enable = false; 
  };  # Enable sound.

}
