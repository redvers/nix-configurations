{ config, lib, pkgs, ... }:

{

  nix.buildCores = 8;
  nix.nixPath = [ "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos" "nixos-config=/etc/nixos/configuration.nix" "/nix/var/nix/profiles/per-user/root/channels" "nixpkgs-overlays=/etc/nixos/overlays" ];
  # Use the GRUB 2 boot loader.
  boot.supportedFilesystems = [ "zfs" "exfat" "cifs" ];
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

#  boot.initrd.luks.devices = [{
#    name = "root"; device = "/dev/sda3";
#    allowDiscards = true;
#  }];


  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "EST5EDT";

  # diable pmu
  powerManagement.enable = false;

  # The NixOS release to be compatible with for stateful data such as databases.
#  system.stateVersion = "18.09pre145679";
  services.glusterfs.enable = true;
  
  users.mutableUsers = true;
  users.users.red.isNormalUser = true;
  users.users.red.home = "/home/red";
  users.users.red.packages = [ pkgs.steam ];



#  services.mysql.enable = true;
#  services.mysql.package = pkgs.mysql;

}

