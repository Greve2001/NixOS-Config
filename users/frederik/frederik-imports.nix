{ config, pkgs, ... }:

let
    git_username = import ../../local/frederik/git-username.nix;
    git_email = import ../../local/frederik/git-email.nix;
in
{
    imports = [
        ../../home/shared/main.nix
        ../../home/programs/cli/main.nix 
        (import ../../home/programs/git.nix { username = git_username; email = git_email; })
    ];
}