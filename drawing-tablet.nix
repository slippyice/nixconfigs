{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    #linuxKernel.packages.linux_6_10.digimend # drawing with magic
    config.boot.kernelPackages.digimend # drawing with magic

    usbutils # lsusb and other usb info
    evtest # input event debugging
    evemu # device descriptions and emulations

    opentabletdriver # graphics tablets support
    #libsForQt5.xp-pen-deco-01-v2-driver # requires SUDO to run!!!
    #libwacom # doesn't support XPPen Deco LW
    #wacomtablet # KDE configuration module
  ];

  hardware.opentabletdriver.enable = true;
  services.xserver.digimend.enable = true;

#  We don't talk about this one...
#  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
#    "xp-pen-deco-01-v2-driver"
#  ];


  # Make sure the Tablet is correctly identified
  services.xserver.inputClassSections = [
    ''
      Identifier "Deco LW Stylus"
      MatchUSBID "28bd:0935"
      MatchDevicePath "/dev/input/event*"
      MatchIsTablet "on"
      Driver "wacom"
    ''
    ''
      Identifier "Deco LW Keyboard"
      MatchUSBID "28bd:0935"
      MatchDevicePath "/dev/input/event*"
      MatchIsKeyboard "on"
      Driver "libinput"
    ''
  ];

  # Custom Button Mapping
  services.udev.extraHwdb =''
    evdev:input:b0005v28BDp0935*
      KEYBOARD_KEY_70005=k
      KEYBOARD_KEY_70008=m
      KEYBOARD_KEY_700e2=e
      KEYBOARD_KEY_7002c=leftshift
      KEYBOARD_KEY_700e0=0x1d
      KEYBOARD_KEY_70057=a
      KEYBOARD_KEY_70056=z
  '';


  ### Resources

  # Useful Articles
  # https://www.davidrevoy.com/article842/review-xp-pen-artist-24-pro-on-linux
  # https://nek0.eu/posts/2021-06-27-Hacking-my-XP-Pen-drawing-tablets.html

  # Digimend Input class Sections
  # https://digimend.github.io/support/howto/drivers/wacom/

  # Button Mappings
  # > evtest

  # Keycodes
  # https://hal.freedesktop.org/quirk/quirk-keymap-list.txt

  # udev Device IDs
  # https://wiki.archlinux.org/title/Map_scancodes_to_keycodes#Using_udev
  # > evemu-describe

  ### My Tablet
    #evdev:input:b0003v28BDp0935e0111-e0* # XPPen Deco LW - Wired
    #evdev:input:b0003v28BDp0935* # This globs all the extra stuff
    #evdev:input:b0005v28BDp0935e0001-e0* # XPPen Deco LW - Bluetooth
    #evdev:input:b0005v28BDp0935* # GLOB - XPPen Deco LW - Bluetooth
      #KEYBOARD_KEY_d0042=     # [Pen Stylus]
      #KEYBOARD_KEY_d0044=     # [Pen 1]
      #KEYBOARD_KEY_70045=     # [Pen 2]
      #KEYBOARD_KEY_70005=     # [1]
      #KEYBOARD_KEY_70008=     # [2]
      #KEYBOARD_KEY_700e2=     # [3]
      #KEYBOARD_KEY_7002c=     # [4]
      #KEYBOARD_KEY_700e0=0x1d # [Ctrl|5|6|7|8] = Ctrl
      #KEYBOARD_KEY_70016=     # [5]
      #KEYBOARD_KEY_7001d=     # [6]
      #KEYBOARD_KEY_70057=     # [7]
      #KEYBOARD_KEY_70056=z    # [8] = z

}
