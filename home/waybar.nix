let
  theme = import ../theme;
in
{
  home.file = {
    # Style 
    ".config/waybar/style.css".text = ''

* {
    border: none;
    border-radius: 0;
    font-family: Cartograph CF Nerd Font, monospace;
    font-weight: bold;
    font-size: 28px;
    min-height: 0;
}

window#waybar {
    color: #${theme.primary-color};
    padding: 20px;
    /*margin: 20px;*/ /*superseeded by config*/
    background: rgba(30, 30, 46, 0.9);
}

tooltip {
    background: #1e1e2e;
    border-radius: 20px;
    border-width: 4px;
    border-style: solid;
    border-color: #11111b;
}

/* Workspace Buttons */
#workspaces button {
    color: #${theme.secondary-color};
    margin: 0px 10px 0px 10px;
}

#workspaces button label {
	  font-size: 36px;
}

#workspaces button.visible {
    color: #${theme.inactive-color};
}

#workspaces button.active {
    color: #${theme.primary-color};
}


#window {
    color: #${theme.secondary-color};
}

#window,
#clock,
#battery,
#pulseaudio,
#network,
#workspaces,
#tray,
#backlight {
  margin: 10px 20px;
}
    '';






    # Config
    ".config/waybar/config".text = ''
{
    "layer": "top",
    "position": "top",
    "exclusive": true,
    "passtrough": false,
    "gtk-layer-shell": true,
    "height": 0,
    "margin": 0,
    "modules-left": [
        "clock",
        "hyprland/workspaces"
    ],
    "modules-center": ["hyprland/window"],
    "modules-right": [
        "tray",
        "network",
        "backlight",
	      "pulseaudio",
	      "pulseaudio#microphone",
	      "battery"
    ],

    "hyprland/window": {
        "format": "{}"
    },

    "hyprland/workspaces": {
        "all-outputs": true,
        "on-click": "activate",
        "format": "{icon}",
        "format-icons": {
            "1": "󰲡",
            "2": "󰲣",
            "3": "󰲥",
            "4": "",
            "5": "",
	          "6": "󰭹",
            "urgent": "",
            "default": ""
        },
        "persistent-workspaces": {
          "*": 6
      }
    },

    "tray": {
        "icon-size": 30,
        "tooltip": false,
        "spacing": 20
    },

    "clock": {
        "format": "{: %R   %d/%m}",
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"
    },

    "backlight": {
	      "format": "{icon} {percent}%",
	      "device": "intel_backlight",
	      "format-icons": ["", "󰃟", "󰃠"]
    },

    "pulseaudio": {
        "format": "{icon} {volume}%",
        "tooltip": false,
        "format-muted": " Muted",
        "format-icons": {
            "headphone": "",
            "hands-free": "",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": ["", "", ""]
        }
    },

    "pulseaudio#microphone": {
        "format": "{format_source}",
        "tooltip": false,
        "format-source": " {volume}%",
        "format-source-muted": " Muted",
    },

    "battery": {
    	  "bat": "BAT0",
    	  "interval": 60,
    	  "states": {
            "warning": 30,
            "critical": 15
    	  },
        "format": "{icon} {capacity}%",
        "format-icons": ["", "", "", "", ""],
        "format-charging": " {capacity}%",
        "max-length": 25
    },

    "network": {
        "interface": "wlp59s0",
        "format": "{ifname}",
        "format-wifi": " {essid}",
        "format-ethernet": "󰈁 {ipaddr}/{cidr}",
        "format-disconnected": "", //An empty format will hide the module.
        "tooltip-format": "{ifname} via {gwaddr} ",
        "tooltip-format-wifi": "{essid} ({signalStrength}%) ",
        "tooltip-format-ethernet": "{ifname} ",
        "tooltip-format-disconnected": "Disconnected",
        "max-length": 50
    },
}
    '';
  };
}
