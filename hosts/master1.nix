{config, pkgs, ...}:
{
  networking.hostName = "master1";
  networking.interfaces.ens2.useDHCP = true;

  networking.interfaces.ens2.ipv6.addresses = [ {
    address = "2001:bc8:600:2227::1";
    prefixLength = 64;
  } ];
  networking.defaultGateway6 = {
    address = "2001:bc8:600:2227::";
    interface = "ens2";
  };

  imports = [
    ../k8s-base.nix
  ];
}
