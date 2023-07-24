{ config, pkgs, ... }:

{
  users.users.frederik = {
    isNormalUser = true;
    description = "Frederik Greve Petersen";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
	# Packages
	pkgs.tlp
	pkgs.flameshot
	pkgs.signal-desktop
    ];
  };

  # User Programs
  home-manager.users.frederik = { pkgs, ... }: {
    home.stateVersion = "23.05";

    # Git
    programs.git = {
      enable = true;
      userName = "Greve2001";
      userEmail = "frederik.greve@gmail.com";
    };

    # Zsh
    programs.zsh = {
      enable = true;
      shellAliases = {
        update = "sudo nixos-rebuild switch";
      };
      history = {
	size = 10000;
      };
    };

    # Starship
    programs.starship = {
      enable = true;
      # settings = {};
    };
  };



  # Startup Applications
  systemd.user.services.nextcloud-client = {
    description = "Nextcloud Service";
    script = '' nextcloud & '';
    wantedBy = [  "multi-user.target" ]; # At user login
  };

}

