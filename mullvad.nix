{ config, pkgs, ... }:

{
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;
  services.resolved.enable = true;

  environment.systemPackages = [
    pkgs.mullvad-vpn # for the mole men
  ];
}
