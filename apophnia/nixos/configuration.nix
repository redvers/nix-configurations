{ ... }: {

  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./packages.nix
    ./system.nix
  ];
}
