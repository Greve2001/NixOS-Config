{ config, pkgs, ... }:

{
    imports = [
        ../../home/shared/main.nix
        ../../home/programs/cli/main.nix
    ];
}