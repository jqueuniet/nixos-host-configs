{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cni
    cni-plugins
    iptables
    conntrack-tools
  ];
  virtualisation.containerd.enable = true;

  boot.kernelModules = [ "br_netfilter" ];
  boot.kernel.sysctl = {
    "vm.swappiness" = 1;
    "net.bridge.bridge-nf-call-ip6tables" = 1;
    "net.bridge.bridge-nf-call-iptables" = 1;
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };

  networking.firewall.enable = false;
}
