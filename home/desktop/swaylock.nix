{ pkgs, ... }:

let
  theme = import ../theme;

  lockscreen = pkgs.writeShellScriptBin "lockscreen" ''
    swaylock -i "${theme.wallpaper}"
  '';
in {
  home = {
    packages = [ lockscreen ];

    file.".config/swaylock/config".text = ''
      ring-color=${theme.secondary-color}
      key-hl-color=${theme.primary-color}
      line-uses-inside
    '';
  };
}
