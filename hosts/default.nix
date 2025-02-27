{ pkgs, config, ...}:
{
	
	imports = [
    ../modules/virtualization
		../users
  ];
		      
  environment.systemPackages = with pkgs; [
	  git
    wget
    direnv
    tmux
    sshfs
    bash
    killall
    unzip
	  zstd
		acpi
  ];
  
  programs.zsh.enable = true;

  services.kubo = {
    enable = true;
  };
}
