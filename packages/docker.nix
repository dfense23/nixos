{ config, lib, pkgs, ... }: {
  virtualisation.docker.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    docker-compose
  ];


}
