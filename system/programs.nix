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
    # inputs.nixvim.packages."x86_64-linux".default

    # Applications - Move to Home Manager to configure.
    chromium
    thunderbird
    nextcloud-client
    steam-run
    protontricks
    libreoffice-fresh
    signal-desktop
    spotify
    zathura

    # Utilites
    brightnessctl
    pavucontrol
    pipr
    xdg-desktop-portal-hyprland

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
    gnumake
    gcc
    virtualenv
    docker
    docker-compose
    postman
    beekeeper-studio

    jdk17
    jdk21
    maven
    kotlin
    python3
    rustc
    cargo
    cargo-modules
    dotnet-sdk_8
    dotnet-runtime_8
    dotnet-aspnetcore_8
    dotnet-ef
    nodejs_20
    sqlcmd
    elixir_1_17
    erlang
    go
    #sbclPackages.mssql

    # LSPs
    luarocks
    elixir-ls
    lua-language-server
    haskellPackages.lsp
    rust-analyzer
    csharp-ls
    gopls
    vue-language-server
    vscode-langservers-extracted

    # Formatters
    stylua
    rustfmt
    nixfmt-rfc-style
    shfmt
    prettierd
    csharpier

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
        ms-azuretools.vscode-docker

        ms-dotnettools.vscode-dotnet-runtime
        vue.volar
        dbaeumer.vscode-eslint
      ];
    })
    zed-editor
    neovim

    # Wayland
    wayland
    xwayland
    greetd.tuigreet

    # 3D Printing
    orca-slicer

  ];
}
