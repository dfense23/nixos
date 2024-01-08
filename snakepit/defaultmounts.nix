
{ config, pkgs, lib, ... }:
{
  fileSystems."/mnt/spnas01media" = {
    device = "192.168.1.3:/volume2/media";
    fsType = "nfs";
    options = [ "noatime" ];
  };

  fileSystems."/mnt/spnas01pmedia" = {
    device = "192.168.1.3:/volume2/pmedia";
    fsType = "nfs";
    options = [ "noatime" ];
  };

  fileSystems."/mnt/divx" = {
    device = "192.168.1.3:/volume2/divx";
    fsType = "nfs";
    options = [ "noatime" ];
  };
  fileSystems."/mnt/share" = {
    device = "192.168.1.3:/volume2/share";
    fsType = "nfs";
    options = [ "noatime" ];
  };
}
