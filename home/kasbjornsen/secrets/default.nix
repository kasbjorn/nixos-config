{ inputs, config, pkgs, lib, ...}:
{
  config.sops.defaultSopsFile = ./private.yml;
}
