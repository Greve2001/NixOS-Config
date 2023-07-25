{ config, pkgs, ... }:

{
    imports = [
        # Fill later, when everything is moved to different files
    ];

    programs = {
        # Git
        git = {
            enable = true;
            userName = "Greve2001";
            userEmail = "frederik.greve@gmail.com";
        };

        # Zsh
        zsh = {
            enable = true;
            shellAliases = {
                update = "sudo nixos-rebuild switch";
                upgrade = "sudo nixos-rebuild switch --upgrade";
                clean = "sudo nix-collect-garbage"; 
            };
            history = {
                size = 10000;
            };
        };

        # Starship
        starship = {
            enable = true;
            # settings = {};
        };

        # Other
        tlp.enable = true;
        flameshot.enable = true;
        signal-desktop.enable = true;
        teams.enable = true;
        discord.enable = true;
        spotify.enable = true;
        pkgs.vscode = true;
    }
}