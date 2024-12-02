{ config, pkgs, lib, ...}:

{

  # printing

  services.printing.enable = true;

  # scanning

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.epkowa ];
  };

  users.users.slips.extraGroups = [ "scanner" "lp" ];


}
