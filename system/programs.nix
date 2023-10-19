{ pkgs, ... }:

let gitpolite = pkgs.callPackage ../pkgs/gitpolite { };
in
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.ssh.startAgent = true;

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.steam = { enable = true; };

  environment.systemPackages = with pkgs; [
    # Desktop Setup
    networkmanagerapplet
    flameshot
    rofi
    redshift

    # Utility and Tools
    wget
    pciutils
    git
    gh
    neofetch
    patchelf
    glxinfo
    ripgrep
    zip
    unzip
    tlp
    virt-manager
    wineWowPackages.full

    # Applications
    firefox
    thunderbird
    nextcloud-client
    steam-run
    protontricks
    libreoffice-fresh
    signal-desktop
    teams
    discord
    spotify
    obsidian
    krita
    joplin-desktop

    # Development
    file
    xz
    libGLU
    android-studio
    jetbrains.idea-ultimate
    gnumake
    gcc
    virtualenv
    gitpolite

    # SDKs
    jdk
    dotnet-sdk
    python39

    # VS Code Config        
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
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
        ms-python.python

        bbenoist.nix
        redhat.java
      ];
    })
  ];

  environment.variables = {
    # Editors
    EDITOR = "nvim";
    VISUAL = "nvim";

    # UI Scaling
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    QT_AUTO_SCREEN_SET_FACTOR = "0";
    QT_SCALE_FACTOR = "1.75"; # Updated from '2'
    QT_FONT_DPI = "92";
  };
}
