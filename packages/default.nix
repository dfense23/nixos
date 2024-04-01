{ config, lib, pkgs, ... }: {

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  imports = [
    ./docker.nix
  ];
  docker.enable = lib.mkDefault true;

  environment.systemPackages = with pkgs; [
    cifs-utils
    nfs-utils
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    eza
    git
    lazygit
    jujutsu
    gh
    zoxide
    navi
    gcc
    duf
    protonvpn-gui
    protonvpn-cli
    wirelesstools
    manix
    ncdu
    nvd 
    du-dust
    fd
    ];
}
