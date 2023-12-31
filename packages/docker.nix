{ config, lib, pkgs, ... }: {
  virtualisation.docker.enable = true;
  virtualisation.docker.liveRestore = false; # true is incompatible with swarm
  virtualisation.docker.enableOnBoot = true;

  environment.systemPackages = with pkgs; [
    docker-compose
  ];


}
