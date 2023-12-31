
{ config, pkgs, lib, ... }:
{
  fileSystems."/mnt/spnas01media" = {
    device = "192.168.1.3:/volume2/media";
    fsType = "nfs";
    options = [ "noatime" ];
  };

  fileSystems."/mnt/spnas02media" = {
    device = "192.168.1.4:/spnas02media";
    fsType = "nfs";
    options = [ "noatime" ];
  };

  fileSystems."/mnt/spnas01docker" = {
    device = "192.168.1.3:/volume1/docker";
    fsType = "nfs";
    options = [ "noatime" ];
  };

  fileSystems."/mnt/divx" = {
    device = "192.168.1.3:/volume2/divx";
    fsType = "nfs";
    options = [ "noatime" ];
  };
}
