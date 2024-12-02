# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # LATEST KERNEL
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxPackages_6_6;
  boot.kernelPackages = pkgs.linuxPackages_6_11;

  # HOSTNAME
  networking.hostName = "nyxos"; # Define your hostname.

  # FLAKES
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable GNOME Desktop Environment.
#  services.xserver.displayManager.gdm.enable = true;
#  services.xserver.desktopManager.gnome.enable = true;

  services.xserver = {
  #  desktopManager.xfce.enable = true;
  #  windowManager.icewm.enable = true;
  };
  #services.xrdp.defaultWindowManager = "icewm";
  #xdg.portal = {
  #  enable = true;
  #  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #};

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  #services.printing.enable = true;

  # Enable sound with pipewire.
  #sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.slips = {
    isNormalUser = true;
    description = "Slippy Ice";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      ##### Scythe Suggestions #####
      zathura # The PDF viewer
      obs-studio
      yt-dlp # Media downloader for many sites
      glow # Command line Markdown viewer
      tauon # Music player
      #davinci-resolve # The video editor
      steam-run # To run Davinci atm, curtesy of Mr Newell
      appimage-run
      imagemagick
      pandoc # Ultimate Document converter
      texlive.combined.scheme-full # Needed by pandoc & others to convert to PDF
      libreoffice # The FOSS office suite
      keepassxc
      vscodium
      lutgen # LUT utility for wallpapers and stuff
      nwg-look
      helix # The post-modern editor
      marksman # A nice Markdown LSP
      element-desktop # The Matrix client
      ffmpeg_6-full # The video converter 

      ##### Mine #####
      #neofetch # a requirement for unix
      fastfetch # does it faster
      krita # Makes KDE fanart
      inkscape # Vector is magic
      keepass # The classic look
      ponysay # Friendship is Magic
      giac-with-xcas # Computer Algebra System
      audacity # speaks for itself
      anki # flash cards
      nmap # network scanning
      wiiuse # driver for the best game controller
      dua # disk usage anal
      dust # disk anal but fancy
      smartmontools # smart ssds
      thunderbird # bird mail
      kicad # PCB design
      gparted # format all the floppies!
      OSCAR # for the somnolencent
      r2modman # lethal mods
      #archivebox # personal internet archive 
      brave
      hexchat # irc chat
      #dwarf-fortress-packages.dwarf-fortress_0_47_05
      #dwarf-fortress-packages.dwarf-therapist
      lsp-plugins # wired sound for wired people
      #blender
      ghidra # the engineer!
      wine
      wine64
      lm_sensors

      john # the ripper
      johnny
      autopsy # Just one more thing...

      clingo # for school

      #freecad
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ##### Scythe Suggestions #####
    vim # The classic.
    neovim # The new classic.
    btop # Neat system monitor
    #imv # Minimal Wayland image viewer
    mpv # The God of video / media players
    clang # C compiler
    gcc # GNU Compiler Collection
    git
    wget
    appimage-run # Tool for running appimages in NixOS
    starship # Terminal prompt written in Rust
    wl-clipboard # Needed for some terminals to copy text to clipboard
    kitty # He put so much work into it, unfortunately made it better
    detox # Sanitizes filenames of special chars
    yazi # The Rust TUI file manager
    firefox
    gnome-disk-utility # Great disk utility
    smartmontools # Disk health monitoring stuff
    fd # Rust alternative to the find command
    fzf # Great cl fuzzy finder in GO
    ripgrep # Rust based recursive line search tool
    zoxide # Rust alt to cd but smarter, integrates with yazi
    eza # Rust based ls alternative
    unar # The great archive tool 
    python3 # They put so much money into it, unfortunately made it better
    
    ##### MINE #####
    gnumake # GNU make for project management
    curl

    #sof-firmware

    #alsa-firmware
    #alsa-topology-conf
    #alsa-ucm-conf
    #alsa-oss
    #alsa-lib
    #alsa-utils
    #alsa-tools
    #alsaequal
    pciutils

    #pipewire

    #carla

    easyeffects

    # Old and Wise Monks
    (perl.withPackages(p: with p; [
      ModernPerl
      DataDump
      TimePiece
    ]))

    flatpak # For sandboxing
    fish # User-friendly fishy shells
    nix-tree # makes nix-store easy to view

    #libsForQt5.polonium # kde tiling

    p7zip # for 7zippy things

    ripgrep # better search
    ripgrep-all # search inside docs

    #jujutsu # git alternative, its RAW!!! needs to still be cooked
  ];

  environment.variables.EDITOR = "vim";

  services.flatpak.enable = true;

  #programs.steam.enable = true

  # Gnome made us need this
  programs.dconf.enable = true;

  # Thanks Gaben
  programs.gamemode.enable = true;

  # Set shell to Fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

#  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
#    "steam-original"
#    "steam-run"
#  ];

  # Enable udev for drawing tablet and fw16 config
  services.udev.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}

