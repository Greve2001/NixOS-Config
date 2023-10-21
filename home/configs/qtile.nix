let
  theme = import ../../theme;
  wallpaper-path = ../../theme/background.jpg;
in
{
  text = ''
    
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
alt = "mod1"
ctrl = "control"
shift = "shift" 

terminal = guess_terminal()


# -------------------- Groups -------------------- #

groups = []
group_names = ['1', '2', '3', '4', '5', '6', '7']
group_labels = ['󰲡', '󰲣', '󰲥', '󰲧', '󰲩', '󰭹', '']

for i in range(len(group_names)):
  groups.append(
    Group(
      name=group_names[i],
      label=group_labels[i]
    )
  )



# -------------------- Process Bar -------------------- #

process_bar = bar.Bar(
    [
        # Right Side
        widget.CurrentLayout(),
        widget.GroupBox(
            margin_x=7,
            padding_x=4,

            highlight_method='text',
            this_current_screen_border='${theme.primary-color}',
            other_current_screen_border='${theme.secondary-color}',
            
            urgent_alert_method='text',
            urgent_border='${theme.error-color}',
            urgent_text='${theme.error-color}',
        ),
        widget.Prompt(
            foreground='${theme.primary-color}'
        ),
        

        widget.Spacer(),

        # Left side
        widget.Systray(icon_size=32),
        widget.Spacer(length=20),
        widget.Battery(
            fmt='Bat: {}'
        ),
        widget.Spacer(length=20),
        widget.PulseVolume(
            fmt='Vol: {}',
            volume_app='pavucontrol'
        ),
        widget.Spacer(length=20),
        widget.Clock(format="%d-%m-%Y %a %H:%M %p"),
    ], 
    50 # Size
)

    
# -------------------- Keymaps -------------------- #

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, shift], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, shift], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, shift], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, shift], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, ctrl], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, ctrl], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, ctrl], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, ctrl], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, ctrl], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    #Key([mod, ctrl], "s", lazy.layout.toggle_split(),desc="Toggle between split and unsplit sides of stack"),
    
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod], "t", lazy.spawn(terminal), desc="Launch terminal"),
    
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, shift], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod], "f", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),

    # Kill window
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    
    # Spawning
    Key([mod], "Return", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod, shift], "Return", lazy.spawn('rofi -show run'), desc="Start Rofi"),
    
    # Shutdown and Reboot
    Key([mod, shift, ctrl], "q", lazy.spawn('poweroff'), desc="Shutdown"),
    Key([mod, shift, ctrl], "r", lazy.spawn('reboot'), desc="Restart"),
    Key([mod, ctrl], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Meta
    Key([mod, alt, ctrl], "r", lazy.reload_config(), desc="Reload the config"),
]

for i in groups:
    keys.extend(
        [
            Key([mod], i.name, lazy.group[i.name].toscreen(), desc="Switch to group {}".format(i.name)),
            Key([mod, shift], i.name, lazy.window.togroup(i.name, switch_group=True), desc="Switch to & move focused window to group {}".format(i.name)),
            Key([mod, alt, shift], i.name, lazy.window.togroup(i.name), desc="move focused window to group {}".format(i.name)),
        ]
    )



# -------------------- Layouts -------------------- #

layouts = [
    layout.Columns(
        border_focus_stack=['${theme.primary-color}', '${theme.primary-color}'],
        border_focus='${theme.primary-color}',
        border_width=5
    ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=32,
    padding=4,
)
extension_defaults = widget_defaults.copy()



# -------------------- Layouts -------------------- #

screens = [
    Screen(
      wallpaper='${wallpaper-path}',
      bottom=process_bar
    ),
]





# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True


wmname = "LG3D"

  '';
}
