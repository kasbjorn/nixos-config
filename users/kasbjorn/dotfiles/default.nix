{ pkgs, config, ...}:

{
    home.file = {
      ".config/kitty/nord.conf".source = ./kitty/nord.conf;
      ".emacs.d".source = ./emacs.d;
    };
}
