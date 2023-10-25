{ pkgs, ... }:

{ 
  imports = [ ./hypr ./waybar ./swaylock.nix ]; 

  home = {
    packages = with pkgs; [
      grim
      slurp
      swayidle
      swaylock
      wl-clipboard 
      hyprpaper
      waybar
      wofi
      dunst
      eww-wayland
    ];
  };
}
