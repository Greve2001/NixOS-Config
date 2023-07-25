{ config, pkgs, ... }:

{
  users.users.frederik = {
    isNormalUser = true;
    description = "Frederik Greve Petersen";
    extraGroups = [ 
        "networkmanager" 
        "wheel" 
    ];
  };

    home-manager.users.frederik = import ../home/frederik/main.nix;
    home-manager.users.frederik.home.stateVersion = "23.05";
}