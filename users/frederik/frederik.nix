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
            vscode
	        lutris

            # Development
            file
            xz
            libGLU
            jdk
            android-tools
            flutter
            android-studio
        ];
    };

    home-manager.users.frederik = import ./frederik-imports.nix;
}
