{
  programs.zsh = {
    enable = true;
    autocd = true;
    #autosuggestions.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history = { size = 10000; };
    shellAliases = {
      # NixOS specific
      update = "sudo nixos-rebuild switch";
      upgrade =
        "(cd /etc/nixos && sudo nix flake update) && sudo nixos-rebuild switch";
      clean = "sudo nix-collect-garbage";
      test = "sudo nix-rebuild test";

      # Utility
      grep = "rg"; # ripgrep
      ls = "ls --color=auto";
      ip = "ip -c";
    };
    initExtra = ''
      bindkey '^R' history-incremental-search-backward
    '';
  };
}
