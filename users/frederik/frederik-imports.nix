{ ... }:

let
    git_username = import ../../local/frederik/git-username.nix;
    git_email = import ../../local/frederik/git-email.nix;
in
{
    imports = [
        ../../home/shared/main.nix
        ../../home/cli/main.nix 
        (import ../../home/git.nix { username = git_username; email = git_email; })
    ];
}