{ pkgs, ... }:

{ 
  imports = [ ./hypr ./waybar ./swaylock.nix ./tofi.nix ]; 

  home = {
    packages = with pkgs; [
      grim
      slurp
      swayidle
      swaylock
      wl-clipboard 
      hyprpaper
      waybar
      tofi
      dunst
      eww-wayland
    ];
  };
}
