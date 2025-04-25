{pkgs, ...}:

{
	systemd.services.xwayland-satellite = {
		wantedBy = ["graphical-session.target"];
		after = [ "graphical-session.target"];
		serviceConfig = {
			User = "kasbjornsen"
			ExecStart = ''${pkgs.xwayland-satellite}/bin/xwayland-satellite'';
			ExecStop = "pkill xwayland";
		};
		
		environment.systemPackages = [ pkgs.xwayland-satellite ];
	};
}
