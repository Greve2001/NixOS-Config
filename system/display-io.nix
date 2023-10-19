{ pkgs, ... }:

{
  # Display Server
  services.xserver = {
    enable = true;
    layout = "dk";
    xkbVariant = "";
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    konsole
    khelpcenter
  ];

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

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
  fonts.fonts = with pkgs; [ nerdfonts ];
}

