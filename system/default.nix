{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./network.nix
    ./power-management.nix
    ./specializations.nix
    ./startup.nix
    ./programs.nix
  ];

  services = {
    # Display Server & Desktop Manager
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
    };

    # CUPS printing
    printing.enable = true;

    # Trimming of SSD
    fstrim.enable = true;
  };


  environment = {
    plasma5.excludePackages = with pkgs.libsForQt5; [
      elisa
      konsole
      khelpcenter
    ];

    variables = {
      # Editors
      EDITOR = "nvim";
      VISUAL = "nvim";

      # UI Scaling
      #GDK_SCALE = "2";
      #GDK_DPI_SCALE = "0.5";
      #QT_AUTO_SCREEN_SET_FACTOR = "1";
      #QT_ENABLE_HIGHDPI_SCALING = "1";
      #QT_SCALE_FACTOR = "1.75"; # Updated from '2'
      #QT_FONT_DPI = "96";

      # X11
      #XCURSOR_SIZE = "26";

      # Wayland
      #WLR_NO_HARDWARE_CURSORS = "1";
      #NIXOS_OZONE_WL = "1"; # For electron apps
      #LIBVA_DRIVER_NAME = "nvidia";
      #XDG_SESSION_TYPE = "wayland";
      #GBM_BACKEND = "nvidia-drm";
      #__GLX_VENDOR_LIBRARY_NAME = "nvidia";
      #MOZ_ENABLE_WAYLAND = "1";
      #MOZ_DBUS_REMOTE = "1";
      #NVD_BACKEND = "direct";
    };
  };

  # Hardware
  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
    pulseaudio.enable = false;
  };

  # XDG portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Sound
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Locales and More
  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_DK.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_DK.UTF-8";
    LC_IDENTIFICATION = "en_DK.UTF-8";
    LC_MEASUREMENT = "en_DK.UTF-8";
    LC_MONETARY = "en_DK.UTF-8";
    LC_NAME = "en_DK.UTF-8";
    LC_NUMERIC = "en_DK.UTF-8";
    LC_PAPER = "en_DK.UTF-8";
    LC_TELEPHONE = "en_DK.UTF-8";
    LC_TIME = "en_DK.UTF-8";
  };

  # Fonts
  fonts.packages = with pkgs; [ nerdfonts ];
}

