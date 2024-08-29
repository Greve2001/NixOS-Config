{ pkgs, inputs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  programs = {
    ssh.startAgent = true;
    zsh = {
      enable = true;
      autosuggestions.enable = true;
    };
    steam.enable = true;
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
    spotify
    krita
    joplin-desktop
    zathura
    livebook

    # Utilites
    brightnessctl
    pavucontrol
    pipr

    # For getting eww to work
    socat
    jq
    iw

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

    jdk17
    jdk21
    maven
    kotlin
    dotnet-sdk
    python3
    rustc
    cargo
    cargo-modules
    dotnet-sdk_7
    dotnet-runtime_7
    dotnet-aspnetcore_7
    nodejs_20
    sqlcmd
    elixir_1_17
    erlang
    #sbclPackages.mssql

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
        ms-vscode.cpptools

        ms-dotnettools.csharp # Ionide dependency
        ionide.ionide-fsharp
        ms-python.python

        bbenoist.nix
        redhat.java
        elixir-lsp.vscode-elixir-ls
      ];
    })

    # Wayland
    wayland
    xwayland
    greetd.tuigreet
  ];
}
