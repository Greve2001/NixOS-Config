{ pkgs, ... }:

{
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            # Theme
            zhuangtongfa.material-theme
            pkief.material-icon-theme

            # Utility
            vscodevim.vim
            yzhang.markdown-all-in-one
            shd101wyy.markdown-preview-enhanced

            # Programming Languages and Linters
            ms-dotnettools.csharp # Ionide dependency
            ionide.ionide-fsharp

            bbenoist.nix
            redhat.java
        ];
    };
}
