let theme = import ../../theme;
in {
  # Hyprpaper
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${theme.wallpaper}

    wallpaper = , ${theme.wallpaper}
  '';
}
