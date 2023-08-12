{ config, pkgs, ... }:

{
    system.stateVersion = "23.05"; # DONT TOUCH
  
    imports = [ 
        <home-manager/nixos>
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
}
