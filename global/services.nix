{ config, pkgs, ... }:

let
  login = [ "multi-user.target" ];
in
{
  # Startup Applications
  systemd.user.services.nextcloud-client = {
    description = "Nextcloud Service";
    script = "nextcloud &";
    wantedBy = login;
  };

  # Display Server
  services.xserver = {
    enable = true;
    layout = "dk";
    xkbVariant = "";
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

  console.keyMap = "dk-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Locales and More
  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_DK.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };


  # TLP
  services.tlp = {
      enable = true;
      settings = {
	# CPU
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

	CPU_MIN_PERF_ON_AC = 0;
	CPU_MAX_PERF_ON_AC = 75;
	CPU_MIN_PERF_ON_BAT = 0;
	CPU_MAX_PERF_ON_BAT = 30;

	CPU_SCALING_MIN_FREQ_ON_AC = 0;
	CPU_SCALING_MAX_FREQ_ON_AC = 2600000; # Max = 4300000
	CPU_SCALING_MIN_FREQ_ON_BAT = 0;
	CPU_SCALING_MAX_FREQ_ON_BAT = 1500000; # Max = 4300000
      };
    };
  
  services.power-profiles-daemon.enable = false;
  boot.blacklistedKernelModules = [
     "nouveau"
  ];
  services.upower.enable = true;
}
