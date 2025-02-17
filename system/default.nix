{ pkgs, lib, ... }:

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
    #xserver.dpi = 192; # Scaling

    # Greeter
    greetd = {
      enable = lib.mkDefault true;
      settings = {
        default_session = {
          command = "tuigreet -r -c Hyprland";
        };
      };
    };

    # VPN
    tailscale.enable = true;

    # CUPS printing
    printing.enable = true;

    # Trimming of SSD
    fstrim.enable = true;

    # USB tools
    gvfs.enable = true;
    udisks2.enable = true;
    devmon.enable = true;
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
    graphics.enable = true;
    nvidia.modesetting.enable = true;
    pulseaudio.enable = false;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  # Sound
  security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    blueman.enable = true;
  };

  # Security
  # Allow swaylock to unlock the device
  security.pam.services.swaylock = { };

  # Fonts
  fonts.packages =
    [ ]
    ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  # Environment Variables
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
