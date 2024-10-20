{ pkgs, config, ...}:
{
    imports = [
        ../modules/virtualization
        ../users
    ];

     environment.systemPackages = with pkgs; [
  	vim
	git
        wget
        direnv
        tmux
        sshfs
        bash
        killall
        unzip
        zstd
        kitty
	];

    programs.zsh.enable = true;
}
