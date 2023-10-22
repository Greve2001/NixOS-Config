{ pkgs, inputs, nur, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs = {
    ssh.startAgent = true;

    zsh.enable = true;

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    steam.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    # Desktop Setup
    networkmanagerapplet
    flameshot
    rofi
    arandr
    brightnessctl
    pavucontrol

    # Wayland
    wayland
    hyprpaper

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

    # Flakes
    inputs.nixvim.packages."x86_64-linux".default

    # Applications
    firefox
    thunderbird
    nextcloud-client
    steam-run
    protontricks
    libreoffice-fresh
    signal-desktop
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

    # SDKs
    jdk
    dotnet-sdk
    # python39

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
}
