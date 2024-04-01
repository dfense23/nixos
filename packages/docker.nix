{ config, lib, pkgs, ... }: {
  options = {
    docker.enable = lib.mkEnableOption "Enables docker, installs docker compose";
  };

  config = lib.mkIf config.docker.enable {
    virtualisation.docker.enable = true;
    virtualisation.docker.liveRestore = true; # true is incompatible with swarm
    virtualisation.docker.enableOnBoot = true;
  
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };

}
