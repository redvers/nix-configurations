{ config, lib, pkgs, ... }:

{
  networking.hostId = "d3adb33f";
  networking.hostName = "apophenia"; # Define your hostname.

  # Enable the OpenSSH daemon.
  services.unifi.enable = true;
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";
  services.openssh.extraConfig = ''
    SyslogFacility AUTH
    LogLevel DEBUG
  '';
  networking.firewall.checkReversePath = false;
  networking.firewall.allowedTCPPorts = [ 22 3000 8000 25565 25566 ];
  networking.firewall.allowedUDPPorts = [ 3478 ];

  networking.useDHCP = false;
  networking.interfaces.enp15s0.ip4 = [ { address = "192.168.127.90"; prefixLength = 24; }];
  networking.defaultGateway = "192.168.127.1";
  networking.nameservers = [ "8.8.8.8" ];
  networking.extraHosts = "
192.168.127.128 gluster0
192.168.127.129 gluster1
192.168.127.130 gluster2
192.168.127.131 gluster3
";


}

