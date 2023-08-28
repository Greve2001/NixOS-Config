{ config, pkgs, ... }:

{
    system.stateVersion = "23.05"; # DONT TOUCH
  
    imports = [ 
        <home-manager/nixos>
        ./system/main.nix
        ./users/frederik/frederik.nix
    ];

    # Experimental
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Home Manager
    home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
    };

    # Garbage Collection
    nix.settings.auto-optimise-store = true;
    nix.gc = {
        automatic = true;
        persistent = true;
        dates = "weekly";
        options = "-d";
        randomizedDelaySec = "15min";
    };

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
}
