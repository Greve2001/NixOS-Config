{ config, pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        autocd = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        enableSyntaxHighlighting = true;
        history = {
            size = 10000;
        };
        shellAliases = {
            # NixOS specific
            update = "sudo nixos-rebuild switch";
            upgrade = "sudo nixos-rebuild switch --upgrade";
            clean = "sudo nix-collect-garbage";

            # Utility
            grep = "rp"; # ripgrep
            ls = "ls --color=auto"; 
            ip="ip -c";
        };
    };
}