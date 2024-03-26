{ config, lib, pkgs, ... }: {

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    cifs-utils
    nfs-utils
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    eza
    git
    lazygit
    gh
    zoxide
    navi
    gcc
    duf
    protonvpn-gui
    protonvpn-cli
  ];


}
