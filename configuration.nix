{ config, pkgs, ... }:

{
    system.stateVersion = "23.05"; # DONT TOUCH
  
    imports = [ 
        <home-manager/nixos>
        ./system/main.nix
        ./users/frederik/frederik.nix
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
