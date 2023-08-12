{ config, pkgs, ... }:

{
    imports = [
        ./hardware.nix
        ./services.nix
        ./io.nix
        ./network.nix
        ./fonts.nix
        ./specializations.nix
    ];

    # Shared Programs
    programs.neovim = {
        enable = true;
        defaultEditor = true;
	    viAlias = true;
	    vimAlias = true;
    };

    programs.steam = {
	enable = true;
    };

    # SSH
    programs.ssh.startAgent = true;

    # Use Zsh
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Auto Upgrade
    system.autoUpgrade.enable = true;
    system.autoUpgrade.allowReboot = true;

    # System-wide packages
    environment.systemPackages = with pkgs; [ 
        wget
	    pciutils
	    git
        gh
        neofetch
        patchelf
	    alacritty
        firefox
        nextcloud-client
    	steam-run
        libreoffice-fresh
	    glxinfo
        ripgrep
    ];

    environment.variables = {
        # Editors
        EDITOR = "nvim";
        VISUAL = "nvim";

        # UI Scaling
        GDK_SCALE = "2";
        GDK_DPI_SCALE = "0.5";
        QT_AUTO_SCREEN_SET_FACTOR = "0";
        QT_SCALE_FACTOR = "2";
        QT_FONT_DPI = "92";
    };
}
