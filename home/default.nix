let
  qtile-config = import ./configs/qtile.nix;
in
{
  imports = [
    # Terminal
    ./git.nix 
    ./starship.nix 
    ./zsh.nix 
    ./kitty.nix
    ./hypr.nix
  ];

  # Home Manager Specification
  home = {
    stateVersion = "23.05";

    # Files
    file = {
      # Eduroam certificate
      ".config/ca_eduroam.pem".text =
        builtins.readFile ./certificates/ca_eduroam.pem;
      
      # Xresources
      ".Xresources".text = ''
        Xft.dpi: 192
      '';
    };
  };
}

