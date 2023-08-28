{ ... }:

{
    programs.git = {
        enable = true;
        userName = import ../../local/git-username.nix;
        userEmail = import ../../local/git-email.nix;
    };
}