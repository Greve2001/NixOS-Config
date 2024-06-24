{ config, lib, ... }:

{
  specialisation = {
    # Xorg
    Xorg.configuration = {
      services = {
        xserver = {
          enable = true;
          displayManager.sddm.enable = true;
          desktopManager.plasma5.enable = true;
        };
        greetd = {
          enable = lib.mkForce false;
        };
      };
    };

    # Explicit GPU Offloading
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
            sync.enable = false;
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

    # Constant GPU Offloading
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
            sync.enable = true;
            nvidiaBusId = "PCI:1:0:0";
            intelBusId = "PCI:0:2:0";
          };
        };
      };
    };
  };
}
