{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./network.nix
    ./power-management.nix
    ./startup.nix
    ./locale.nix
    ./programs.nix
    ./specialisations.nix
  ];

  # Services
  services = {
    # Greeter
    greetd = {
      enable = true;
      settings = {
        default_session = { command = "tuigreet -r -c Hyprland"; };
      };
    };

    # CUPS printing
    printing.enable = true;

    # Trimming of SSD
    fstrim.enable = true;
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  # Hardware
  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
    pulseaudio.enable = false;
  };

  # Sound
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Security
  # Allow swaylock to unlock the device
  security.pam.services.swaylock = { };

  # Fonts
  fonts.packages = with pkgs; [ nerdfonts ];

  # Environment Variables
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
