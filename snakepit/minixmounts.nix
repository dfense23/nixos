
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

  fileSystems."/mnt/data/piratedata/media/movies2" = {
    device = "192.168.1.3:/volumeUSB2/usbshare/movies";
    fsType = "nfs";
    options = [ "noatime" ];
  };

  fileSystems."/mnt/data/piratedata/media/tv2" = {
    device = "192.168.1.3:/volumeUSB2/usbshare/tv";
    fsType = "nfs";
    options = [ "noatime" ];
  };

  fileSystems."/mnt/data/piratedata/media/tv" = {
    device = "192.168.1.4:/spnas02media/series";
    fsType = "nfs";
    options = [ "noatime" ];
  };

  fileSystems."/mnt/data/piratedata/usenet" = {
    device = "192.168.1.4:/spnas02media/usenet";
    fsType = "nfs";
    options = [ "noatime" ];
  };

  fileSystems."/mnt/data/piratedata/media/movies" = {
    device = "192.168.1.3:/volume2/media/movies";
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
