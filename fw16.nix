{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    framework-tool # multi tool for fw
    linuxKernel.packages.linux_zen.framework-laptop-kmod # exposes cool hardware to userspace
  ];

  services = {
    power-profiles-daemon.enable = false; # recommended by FW team
  };
  powerManagement.powertop.enable = false;

  boot.kernelParams = [
    "amdgpu.abmlevel=0" # disable active backlight management, sacrifice power for better colors
  ];

  hardware = {
    keyboard.qmk.enable = true; # keyboard pretty mode
  };

  # fix for palm rejection on touchpad while typing
  # https://community.frame.work/t/nixos-on-the-framework-laptop-16/46743/162
  environment.etc = {
    "libinput/local-overrides.quirks".text = ''
      [Keyboard]
      MatchUdevType=keyboard
      MatchName=Framework Laptop 16 Keyboard Module - ANSI Keyboard
      AttrKeyboardIntegration=internal
    '';
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0012", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
    SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0014", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
  '';

  # Fixes for Mediatek wifi cards on F13/F16:. Without the following,
  # Mediatek cards have been limited to 802.11n networks & speeds:
  hardware.wirelessRegulatoryDatabase = true;
  boot.extraModprobeConfig = ''
    options cfg80211 ieee80211_regdom="US"
  '';
  # End Mediatek wifi fixes

  # Enable thermal data
  services.thermald.enable = true;

}
