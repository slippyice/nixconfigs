{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    bluez
    #bluez-tools
    xwiimote
    #wiiuse
    #qjoypad
    dolphin-emu
  ];

  services.udev.packages = [ pkgs.dolphin-emu ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0e8d", ATTRS{idProduct}=="e616", TAG+="uaccess"
    SUBSYSTEM=="net", ATTRS{idVendor}=="0e8d", ATTRS{idProduct}=="e616", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="19ff", ATTRS{idProduct}=="0239", TAG+="uaccess"
  '';

   # SUBSYSTEM=="usb", ATTRS{idVendor}=="19ff", ATTRS{idProduct}=="0239", TAG+="uaccess"
}
