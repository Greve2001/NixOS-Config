{ pkgs, ... }:

{
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    programs.ssh.startAgent = true;

    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;
    
    programs.neovim = {
        enable = true;
        defaultEditor = true;
	    viAlias = true;
	    vimAlias = true;
    };

    programs.steam = {
	    enable = true;
    };

    environment.systemPackages = with pkgs; [ 
        # Utility and Tools
        wget
	    pciutils
	    git
        gh
        neofetch
        patchelf
	    alacritty
	    glxinfo
        ripgrep
        zip
        unzip

        # Applications
        firefox
        nextcloud-client
    	steam-run
        libreoffice-fresh
    ];

    environment.variables = {
        # Editors
        EDITOR = "nvim";
        VISUAL = "nvim";

        # UI Scaling
        GDK_SCALE = "2";
        GDK_DPI_SCALE = "0.5";
        QT_AUTO_SCREEN_SET_FACTOR = "0";
        QT_SCALE_FACTOR = "1.75"; # Updated from '2'
        QT_FONT_DPI = "92";
    };
}