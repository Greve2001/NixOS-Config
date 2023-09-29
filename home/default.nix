{ ... }:

{
    imports = [
        ./git.nix
        ./starship.nix
        ./zsh.nix
        ./kitty.nix
    ];

    # Home Manager Specification
    home = {
        stateVersion = "23.05";

        # Files
        file = {
            # Eduroam certificate
            ".config/ca_eduroam.pem".text = builtins.readFile ../configs/eduroam/ca_eduroam.pem;
        };
    };
}