# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  system.stateVersion = "23.05"; # DONT TOUCH
  
  imports =
    [ <home-manager/nixos>
      ./hardware-configuration.nix
      ./programs-configuration.nix
      ./user-configuration.nix
      ./network-configuration.nix
      ./services-configuration.nix
      ./io-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # SSH
  programs.ssh.startAgent = true;

  # Home Manager
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
  };

  # Use Zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Auto Upgrade
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # System-wide packages
  environment.systemPackages = with pkgs; [ 
    pkgs.wget
    pkgs.git
    pkgs.neofetch
    pkgs.alacritty
    pkgs.firefox
    pkgs.nextcloud-client
];

}
