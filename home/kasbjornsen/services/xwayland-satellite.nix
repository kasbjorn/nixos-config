{pkgs, ...}:

{
	systemd.user.services.xwayland-satellite = {
		Install = {
			WantedBy= ["graphical-session.target"];
		};
		Service = {
			ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
		};
		Unit = {
			After="graphical-session-pre.target";
			PartOf=[ "graphical-session.target"];
		};
	};
  
  	home.packages = [ pkgs.xwayland-satellite ];
}
