{ config, pkgs, ... }:

{
	zramSwap = {
		enable = true;
		algorithm = "zstd";
	};
}
