{ config, inputs, pkgs, nur, ... }:

{
  system.stateVersion = "23.05"; # DONT TOUCH

  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./system
    ./users/frederik.nix
  ];

  # Nix settings
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
  programs.dconf.enable = true;
}
