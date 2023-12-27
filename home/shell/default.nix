{ config, lib, pkgs, ... }: {

  imports = [
    ./bash.nix
    ./starship.nix
    ./tmux.nix
    ./alacritty.nix
  ];

}
