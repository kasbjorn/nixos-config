{pkgs, ...}:

{
	systemd.services.xwayland-satellite = {
		wantedBy = ["graphical-session.target"];
		after = [ "graphical-session.target"];
		serviceConfig = {
      Group = "users";
			ExecStart = "env DISPLAY=:0 ${pkgs.xwayland-satellite}/bin/xwayland-satellite";
			ExecStop = "pkill xwayland";
		};
	};
  
  environment.systemPackages = [ pkgs.xwayland-satellite ];
}
