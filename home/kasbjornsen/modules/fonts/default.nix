{config, pkgs, ...}:

{
	fonts.fontconfig.enable = true;

	home.packages = with pkgs; [
  		noto-fonts
  		noto-fonts-cjk-sans
  		noto-fonts-emoji
  		liberation_ttf
  		fira-code
  		fira-code-symbols

	];
}
