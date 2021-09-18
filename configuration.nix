{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./generic-host.nix
    ./host.nix
  ];

  system.stateVersion = "21.05";
}
