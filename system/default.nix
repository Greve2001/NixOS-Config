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
    # CUPS printing
    printing.enable = true;

    # Trimming of SSD
    fstrim.enable = true;
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

  # Fonts
  fonts.packages = with pkgs; [ nerdfonts ];
}
