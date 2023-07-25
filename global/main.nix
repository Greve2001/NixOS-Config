{ config, pkgs, ... }:

{
    imports = [
        ./hardware.nix
        ./services.nix
        ./io.nix
        ./network.nix
    ];

    # Shared Programs
    programs.neovim = {
        enable = true;
        defaultEditor = true;
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
        pkgs.wget
        pkgs.git
        pkgs.neofetch
        pkgs.alacritty
        pkgs.firefox
        pkgs.nextcloud-client
    ];

    environment.variables = {
        # Editors
        EDITOR = "nvim";
        VISUAL = "nvim";

        # UI Scaling
        GDK_SCALE = "2";
        GDK_DPI_SCALE = "0.6";
        QT_AUTO_SCREEN_SET_FACTOR = "0";
        QT_SCALE_FACTOR = "2";
        QT_FONT_DPI = "92";
    };
}