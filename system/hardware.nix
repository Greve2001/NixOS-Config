# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
    imports = [ 
    	(modulesPath + "/installer/scan/not-detected.nix")
    ];

    
    boot = {
      initrd = {
        availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
        kernelModules = [ ];
      };

      kernelModules = [ "kvm-intel" ];
      extraModulePackages = [ ];
    };


    fileSystems."/" = { 
        device = "/dev/disk/by-uuid/ea035cdb-f325-45f8-9d19-98e0c451da46";
        fsType = "ext4";
    };

    fileSystems."/boot" = { 
		device = "/dev/disk/by-uuid/900E-2834";
        fsType = "vfat";
    };

    swapDevices = [ 
		{ device = "/dev/disk/by-uuid/a2f5c354-0dbf-422a-a57a-e0f9031189f6"; }
    ];

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.wlp59s0.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
