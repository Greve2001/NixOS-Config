{
  home.file.".config/waybar/config".text = ''
      {
        "layer": "top",
        "position": "top",
        "exclusive": true,
        "passtrough": false,
        "gtk-layer-shell": true,
        "height": 0,
        "margin": 10,
        "modules-left": [
            "clock",
            "tray",
        ],
        "modules-center": [
          "hyprland/workspaces"
        ],
        "modules-right": [
            "temperature",
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
    	      "format": "{icon}",
    	      "device": "intel_backlight",
    	      "format-icons": ["", "󰃟", "󰃠"]
        },

        "pulseaudio": {
            "format": "{icon} {volume}%",
            "tooltip": false,
            "format-muted": "󰝟",
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
            "format-source": "",
            "format-source-muted": "",
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


        "temperature": {
          "thermal-zone": 3,
          "format": " {temperatureC}°C",
          "critical-threshold": 90,
          "format-critical": "{temperatureC}°C ",
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
}
