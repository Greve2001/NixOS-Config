{ config, pkgs, ... }:

{
    home = {
        stateVersion = "23.05";

        # Files
        file = {
            # Eduroam certificate
            ".config/ca_eduroam.pem".text = builtins.readFile ../../configs/eduroam/ca_eduroam.pem;
        };
    };
}