{ pkgs, ... }:

{
    # Include Home Manager config
    home-manager.users.frederik = import ../home;

    # User specification
    users.users.frederik = {
        isNormalUser = true;
        description = "Frederik Greve Petersen";
        extraGroups = [ 
            "networkmanager" 
            "wheel" 
        ];
    };
}