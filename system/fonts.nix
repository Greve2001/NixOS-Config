{ config, pkgs, ... }:

{
    fonts.fonts = with pkgs; [
        nerdfonts
    ];
}