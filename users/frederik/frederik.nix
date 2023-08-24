{ pkgs, ... }:

let
    cli = import ../home/programs/cli/main.nix;
in
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
	        lutris
            
            # Development
            file
            xz
            libGLU
            android-studio

            # SDKs
            jdk
            dotnet-sdk
        ];
    };

    home-manager.users.frederik = import ./frederik-imports.nix;
}
