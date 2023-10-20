{ config, lib, ... }:

{
  lib.mkForce.specialisation = {
    # Full Desktop Manager
    plasma-kde.configuration = {
      services = {
        # Display Server & Desktop Manager
        xserver = {
          enable = true;
          layout = "dk";
          xkbVariant = "";
          displayManager.sddm.enable = true;
          desktopManager.plasma5.enable = true;
        };
      };
    };

    # Nvidia
    nvidia-explicit.configuration = {
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware = {
        opengl = {
          enable = true;
          driSupport = true;
          driSupport32Bit = true;
        };

        nvidia = {
          package = config.boot.kernelPackages.nvidiaPackages.stable;
          prime = {
            sync.enable =
              false; # True: Always offloading | False: On-demand offloading
            nvidiaBusId = "PCI:1:0:0";
            intelBusId = "PCI:0:2:0";
            offload = {
              enable = true;
              enableOffloadCmd = true;
            };
          };
        };
      };
    };

    nvidia-always.configuration = {
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware = {
        opengl = {
          enable = true;
          driSupport = true;
          driSupport32Bit = true;
        };

        nvidia = {
          package = config.boot.kernelPackages.nvidiaPackages.stable;
          prime = {
            sync.enable =
              true; # True: Always offloading | False: On-demand offloading
            nvidiaBusId = "PCI:1:0:0";
            intelBusId = "PCI:0:2:0";
          };
        };
      };
    };
  };
}
