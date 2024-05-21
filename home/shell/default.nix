{ config, lib, pkgs, ... }: {

  imports = [
    #./bash.nix
    ./zsh.nix
    ./starship.nix
    ./tmux.nix
    ./alacritty.nix
  ];

}
