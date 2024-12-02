{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    opensnitch # snitches get stitches.
    opensnitch-ui # now in color!

    firejail # the sandbox is on fire!    
  ];

  services.opensnitch = {
    enable = true;
  };

  programs.firejail = {
    enable = true;
  };

}
