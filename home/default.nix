let 
  eduroam_cert = builtins.readFile ./files/ca_eduroam.pem;
in 
{
  imports = [ 
    ./applications 
    ./cli 
    ./desktop 
  ];

  home = {
    stateVersion = "23.05";

    # Files
    file = {
      # Eduroam certificate
      ".config/ca_eduroam.pem".text = eduroam_cert;
    };
  };
}
