let
  theme = import ../theme;
  wallpaper-path = ../theme/background.jpg;
in
{
  # Hyprpaper
  home.file.".config/hypr/hyprpaper.conf".text = ''
preload = ${wallpaper-path}

wallpaper = eDP-1,  ${wallpaper-path}
wallpaper = DP-3,   ${wallpaper-path}
  '';

  # Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    enableNvidiaPatches = true;
    extraConfig = ''
      
# --------------- Monitors --------------- #
monitor = eDP-1,  3840x2160,  1920x0, 2   # Laptop
monitor = DP-3,   3840x2160,  0x0,    2   # Dell Monitor


# --------------- X11 Support --------------- #
# change monitor to hires, the last argument is the scale factor
monitor=,highres,auto,1

# sets xwayland scale
exec-once=xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 1


# --------------- Startup --------------- #
exec-once = hyprpaper
exec-once = waybar
#exec-once = dunst
#exec-once = /usr/lib/polkit-kde-authentication-agent-1
exec-once = nextcloud

# For screen sharing
exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP


# --------------- Environment --------------- #
env = GDK_SCALE,1
env = XCURSOR_SIZE,24


# --------------- Window Rules --------------- #
#windowrulev2 = opacity 0.90 0.90, class:^(.*)$ 


# --------------- Inputs --------------- #
input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = yes
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

device:epic mouse V1 {
    sensitivity = -0.5
}


# --------------- Visual --------------- #
general {
    gaps_in = 3
    gaps_out = 5
    border_size = 3
    col.active_border = rgba(${theme.primary-color}aa)
    col.inactive_border = rgba(595959aa)

    layout = dwindle
}

decoration {
    rounding = 5

    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = yes
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    pseudotile = yes 
    preserve_split = yes
}

master {
    new_is_master = true
}

gestures {
    workspace_swipe = off
}


# --------------- Keymaps --------------- #
# Processes
bind = SUPER, T, exec, kitty
bind = SUPER, Q, killactive, 
bind = SUPER, B, exec, firefox
#bind = SUPER, N, exec, nautilus
#bind = SUPER, RETURN, exec, wofi --show drun

# Shutdowns and reboot
bind = SUPER, L, exec, /home/frederik/.config/swaylock/lockscreen.sh
bind = SUPER SHIFT, L, exec, poweroff
bind = SUPER ALT, L, exit, 
bind = SUPER SHIFT, R, exec, reboot

# Switch Workspace
bind = SUPER, left, workspace, e-1
bind = SUPER, right, workspace, e+1
bind = SUPER, 1, workspace, 1
bind = SUPER, 2, workspace, 2
bind = SUPER, 3, workspace, 3
bind = SUPER, 4, workspace, 4
bind = SUPER, 5, workspace, 5
bind = SUPER, 6, workspace, 6

# Switch Focus
bind = SUPER ALT, left, movefocus, l
bind = SUPER ALT, right, movefocus, r
bind = SUPER ALT, up, movefocus, u
bind = SUPER ALT, down, movefocus, d

# Move To Workspace
bind = SUPER SHIFT, left, movetoworkspace, e-1
bind = SUPER SHIFT, right, movetoworkspace, e+1
bind = SUPER SHIFT, 1, movetoworkspace, 1
bind = SUPER SHIFT, 2, movetoworkspace, 2
bind = SUPER SHIFT, 3, movetoworkspace, 3
bind = SUPER SHIFT, 4, movetoworkspace, 4
bind = SUPER SHIFT, 5, movetoworkspace, 5
bind = SUPER SHIFT, 6, movetoworkspace, 6

# Move Window in Workspace Around
bind = SUPER SHIFT ALT, left, movewindow, l
bind = SUPER SHIFT ALT, right, movewindow, r
bind = SUPER SHIFT ALT, up, movewindow, u
bind = SUPER SHIFT ALT, down, movewindow, d

bind = SUPER SHIFT ALT, RETURN, submap, resize
submap = resize
binde = , right, resizeactive, 10 0
binde = , left, resizeactive, -10 0
binde = , up, resizeactive, 0 -10
binde = , down, resizeactive, 0 10
bind = , RETURN, submap, reset
bind = , ESCAPE, submap, reset 
submap = reset

bindm = SUPER, mouse:272, movewindow
bindm = SUPER, mouse:273, resizewindow

# Other
bind = SUPER, up, togglefloating, 
bind = SUPER SHIFT, RETURN, togglesplit,


# Audio Sink
bind = SUPER CTRL, up, exec, wpctl set-volume @DEFAULT_SINK@ 5%+ &
bind = SUPER CTRL, down, exec, wpctl set-volume @DEFAULT_SINK@ 5%- &
bind = SUPER CTRL, M, exec, wpctl set-mute @DEFAULT_SINK@ toggle &

# Audio Source
bind = SUPER CTRL SHIFT, up, exec, wpctl set-volume @DEFAULT_SOURCE@ 5%+ &
bind = SUPER CTRL SHIFT, down, exec, wpctl set-volume @DEFAULT_SOURCE@ 5%- &
bind = SUPER CTRL SHIFT, M, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle &

# Backlight
bind = SUPER CTRL, left, exec, brightnessctl set 5%- --min-value=10000
bind = SUPER CTRL, right, exec, brightnessctl set 5%+ --min-value=10000

    '';
  };
}
