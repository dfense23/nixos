
{ config, pkgs, lib, ... }:

{
  services.rpcbind.enable = true; # needed for NFS
  systemd.mounts = let commonMountOptions = {
    type = "nfs";
    mountConfig = {
      Options = "noatime";
    };
  };

  in

  [
    (commonMountOptions // {
      what = "192.168.1.3:/volume1/docker";
      where = "/mnt/spnas01docker/";
    })

    (commonMountOptions // {
      what = "192.168.1.3:/volume2/media";
      where = "/mnt/spnas01media/";
    })

    (commonMountOptions // {
      what = "192.168.1.3:/volume2/divx";
      where = "/mnt/divx/";
    })

    (commonMountOptions // {
      what = "192.168.1.4:/spnas02media";
      where = "/mnt/spnas02media/";
    })
  ];
}
