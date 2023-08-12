{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "Greve2001";
        userEmail = "frederik.greve@gmail.com";
    };
}