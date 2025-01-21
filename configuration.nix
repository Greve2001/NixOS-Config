{ config, inputs, pkgs, nur, ... }:

let home = import ./home;
in {
  imports = [ 
    inputs.home-manager.nixosModules.home-manager 
    ./system 
  ];

  system.stateVersion = "23.05"; # DONT TOUCH

  # Nix settings
  nixpkgs.config.allowUnfree = true;
  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    gc = { # Garbage Collecion
      automatic = true;
      persistent = true;
      dates = "weekly";
      options = "-d";
      randomizedDelaySec = "15min";
    };
  };

  # Boot
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    tmp.useTmpfs = true;
  };

  # Home Manager
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
  };

  # Virtualization
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  programs.dconf.enable = true;
  virtualisation.docker.enable = true;

  # Users
  users.users.frederik = {
    isNormalUser = true;
    description = "Frederik Greve Petersen";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" ];
  };
  home-manager.users.frederik = home;
}
