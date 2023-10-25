let 
  theme = import ../../../theme;
in
{
  home.file.".config/waybar/style.css".text = ''
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
        border-radius: 10px;
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
    #backlight,
    #temperature {
      margin: 10px 20px;
    }

  '';
}
