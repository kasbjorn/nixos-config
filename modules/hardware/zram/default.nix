{ config, pkgs, ... }:

{
	zramSwap = {
		enable = true;
		algorithm = "zstd";
	};

	boot.kernel.sysctl = {
			"vm.swappiness" = 180;
			"vm.watermark_boost_factor" = 0;
			"watermark_scale_factor" = 125;
			"page-cluster" = 0;
	};
}
