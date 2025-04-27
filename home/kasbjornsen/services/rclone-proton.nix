{pkgs, ...}:

{
	systemd.user.services.rclone-proton = {
		Install = {
			WantedBy= ["default.target"];
		};
		Service = {
			ExecStart = "${pkgs.rclone}/bin/rclone mount Proton:/ /home/kasbjornsen/Places/Proton --vfs-cache-mode writes";
		};
	};
}
