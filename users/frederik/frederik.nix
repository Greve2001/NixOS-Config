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

            (vscode-with-extensions.override {
                vscodeExtensions = with vscode-extensions; [
                    # Theme
                    zhuangtongfa.material-theme
                    pkief.material-icon-theme

                    # Utility
                    vscodevim.vim
                    yzhang.markdown-all-in-one
                    shd101wyy.markdown-preview-enhanced

                    # Programming Languages and Linters
                    ms-dotnettools.csharp # Ionide dependency
                    ionide.ionide-fsharp

                    bbenoist.nix
                    redhat.java
	            ];
            })

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
