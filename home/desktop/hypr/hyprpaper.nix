let theme = import ../../theme;
in {
  # Hyprpaper
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${theme.wallpaper}

    wallpaper = eDP-1,  ${theme.wallpaper}
    wallpaper = DP-3,   ${theme.wallpaper}
  '';
}
