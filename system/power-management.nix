{ ... }:

{
 	services.tlp = {
 	    enable = true;
 	    settings = {
	 		# CPU
 	      	CPU_SCALING_GOVERNOR_ON_AC = "performance";
 	      	CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
 	      	CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
 	      	CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

 	      	CPU_MIN_PERF_ON_AC = 0;
 	      	CPU_MAX_PERF_ON_AC = 100;
 	      	CPU_MIN_PERF_ON_BAT = 0;
 	      	CPU_MAX_PERF_ON_BAT = 40;

 	      	CPU_BOOST_ON_AC = 0;
 	      	CPU_BOOST_ON_BAT = 0;
 	    };
 	};

 	services.power-profiles-daemon.enable = false;
 	boot.blacklistedKernelModules = [
 	   "nouveau"
 	];
 	services.upower.enable = true;
}