# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  system.stateVersion = "23.05"; # DONT TOUCH
  
  imports =
    [ <home-manager/nixos>
      ./global/main.nix
      ./users/frederik.nix
    ];

  # Home Manager
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Special
  specialisation = {
    nvidia.configuration = {
      services.xserver.videoDrivers = [ "nvidia" ];
      
      hardware = {
        opengl = {
	  enable = true;
	  driSupport = true;
	  driSupport32Bit = true;
	};

	nvidia = {
	  package = config.boot.kernelPackages.nvidiaPackages.stable;
          prime = {
	    sync.enable = true;
	    nvidiaBusId = "PCI:1:0:0";
	    intelBusId = "PCI:0:2:0";
	  };

	  # Fix screen tearing
	  forceFullCompositionPipeline = true;
	};
      };
    };
  };
}
