{ config, pkgs, ... }:

{
  # NeoVim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
