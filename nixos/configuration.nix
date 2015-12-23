{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_4_3;

  networking.hostName = "nixos";

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "America/Los_Angeles";

  # For the time being going to try managing packages under users.
  # environment.systemPackages = with pkgs; [
  #   wget
  # ];

  services.openssh.enable = true;

  # If you want a desktop, uncomment.
  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;

  users.extraUsers.preston = {
    isNormalUser = true;
    home = "/home/preston";
    extraGroups = [ "wheel" ];
    shell = "/run/current-system/sw/bin/bash";
  };

  security.sudo = {
    wheelNeedsPassword = false;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";
}
