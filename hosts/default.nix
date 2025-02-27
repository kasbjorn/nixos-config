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
    pkg-config
    openssl
    openssl.dev
    openssl.out
  ];
  
  programs.zsh.enable = true;

  services.kubo = {
    enable = true;
  };
}
