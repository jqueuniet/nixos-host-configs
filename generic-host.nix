{ config, pkgs, ... }:

{
  networking.useDHCP = false;

  boot.cleanTmpDir = true;
  users.users.root = {
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFuhqKL//SXSFUOynMCUfUa4feGhHgjveCH/5YzSErZ0 johann@sif"
    ];
  };
  users.users.johann = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFuhqKL//SXSFUOynMCUfUa4feGhHgjveCH/5YzSErZ0 johann@sif"
    ];
  };

  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    fish
    tmux
    gptfdisk
    htop
    iotop
    ldns
    lsof
    rsync
    unzip
    git
  ];

  programs.fish.enable = true;

  # List services that you want to enable:

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };

  services.postfix = {
    enable = true;
  };
}
