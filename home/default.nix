let
  qtile-config = import ./configs/qtile.nix;
in
{
  imports = [ ./git.nix ./starship.nix ./zsh.nix ./kitty.nix ];

  # Home Manager Specification
  home = {
    stateVersion = "23.05";

    # Files
    file = {
      # Eduroam certificate
      ".config/ca_eduroam.pem".text =
        builtins.readFile ./certificates/ca_eduroam.pem;

      # Qtile
      ".config/qtile/config.py".text = qtile-config.text;
        
    };
  };
}

