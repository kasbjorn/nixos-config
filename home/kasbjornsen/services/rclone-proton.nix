{pkgs, ...}:

{
	systemd.user.service.rclone-proton = {
		Install = {
			WantedBy= ["default.target"];
		};
		Service = {
			ExecStart = "rclone mount Proton:/ ~/Places/Proton";
		};
	};
}
