{ config, pkgs, ... }:

{
    users.users.frederik = {
        isNormalUser = true;
        description = "Frederik Greve Petersen";
        extraGroups = [ 
            "networkmanager" 
            "wheel" 
        ];
        packages = with pkgs; [
            tlp
            flameshot
            signal-desktop
            teams
            discord
            spotify
            vscode
	        lutris
        ];
    };

    home-manager.users.frederik = import ../home/frederik/main.nix;    
}
