# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # boot.kernelPackages = pkgs.linuxPackages_latest # for latest kernel
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_5_4; # kernel downgrade because of ACPI errors on minix with latest kernel (ic2)

  networking.hostName = "minix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

}
