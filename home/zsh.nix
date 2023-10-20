{ ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history = { size = 10000; };
    shellAliases = {
      # NixOS specific
      update = "sudo nixos-rebuild switch";
      # upgrade = "sudo nixos-rebuild switch --upgrade";  (Pre-Flakyfied System)
      upgrade = "(cd /etc/nixos && sudo nix flake update) && sudo nixos-rebuild switch";
      clean = "sudo nix-collect-garbage";

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
