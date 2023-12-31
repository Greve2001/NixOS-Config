{ pkgs, inputs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  programs = {
    ssh.startAgent = true;
    zsh.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Flakes
    inputs.nixvim.packages."x86_64-linux".default

    # Applications - Move to Home Manager to configure.
    chromium
    thunderbird
    nextcloud-client
    steam-run
    protontricks
    libreoffice-fresh
    signal-desktop
    #discord
    spotify
    #obsidian
    krita
    joplin-desktop
    zathura

    # Utilites
    brightnessctl
    pavucontrol
    pipr

    # For getting eww to work with workspaces
    socat
    jq

    # Tools
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
    rmview
    usbutils
    udiskie 
    udisks

    # Development
    file
    xz
    libGLU
    android-studio
    jetbrains.idea-ultimate
    gnumake
    gcc
    virtualenv

    jdk
    kotlin
    dotnet-sdk
    python3
    rustc
    cargo
    cargo-modules

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

    # Wayland
    wayland
    xwayland
    greetd.tuigreet
  ];
}
