{ config, lib, pkgs, ... }:


{
  environment.systemPackages = with pkgs; [
    python27
    python27Packages.pyserial
    python27Packages.wxPython
    openconnect
    evince
    file
    bind
    whois
    tmux
    nmap
    which
    git
    lsof
    vim
    smartmontools
    lsscsi
    sysstat
    cryptsetup
    zlib
    wget
    bc
    elixir
    wine
    chromium
    firefox
    acpitool
    pciutils
    tcpdump
    wireshark
    erlang
    virtmanager
    virtmanager-qt
    gitAndTools.gitFull
    borgbackup
    ntfs3g
    xorg.libXcursor
    minecraft
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
#####  services.xserver.inputClassSections = [ ''
#####	Identifier "evdev tablet catchall"
#####	MatchIsTablet "on"
#####	MatchDevicePath "/dev/input/event*"
#####	Driver "evdev"
#####  ''];
#####  services.xserver.monitorSection = ''
#####        DisplaySize 476 268
#####  '';
#####  services.xserver.deviceSection = ''
#####       Option "UseEdid" "false" 
#####  '';


#  services.xserver.resolutions = [ { x = 1920 ; y = 1080; } ];
#  services.xserver.autorun = false;
  services.xserver.exportConfiguration = true;
  services.xserver.wacom.enable = true;
  services.xserver.layout = "us";
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.pulseaudio.enable = true;

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  services.xserver.desktopManager.plasma5.enable = true;
#  services.xserver.desktopManager.default = "none";
# services.xserver.desktopManager.enlightenment.enable = true;
#  services.xserver.desktopManager.gnome3.enable = true;

  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemuPackage = pkgs.qemu;

  services.hydra = {
    enable = true;
    hydraURL = "http://localhost:3000";
    notificationSender = "hydra@localhost";
    buildMachinesFiles = [];
    useSubstitutes = true;
  };




}

