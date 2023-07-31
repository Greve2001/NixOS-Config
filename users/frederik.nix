{ config, pkgs, ... }:

{
    users.users.frederik = {
        isNormalUser = true;
        description = "Frederik Greve Petersen";
        extraGroups = [ 
            "networkmanager" 
            "wheel" 
        ];
        packages = [
            pkgs.tlp
            pkgs.flameshot
            pkgs.signal-desktop
            pkgs.teams
            pkgs.discord
            pkgs.spotify
            pkgs.vscode
	    pkgs.lutris
        ];
    };

    home-manager.users.frederik = import ../home/frederik/main.nix;    
}
