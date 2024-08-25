{ pkgs, ... }:

{
  imports = [ ./kitty.nix ./firefox.nix ];

  gtk = {
    enable = true;
    theme.package = pkgs.qogir-theme;
    theme.name = "Qogir-Dark";
    iconTheme.package = pkgs.qogir-icon-theme;
    iconTheme.name = "Qogir-dark";
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
      size = 22; # 44
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintfull";
      gtk-xft-rgba = "rgb";
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintfull";
      gtk-xft-rgba = "rgb";
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.package = pkgs.qogir-kde;
    style.name = "Qogir-Dark";
  };
}
