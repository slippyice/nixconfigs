{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
#    virtualbox # virtual insanity

    qemu

    #gnome.gnome-boxes # you've been gnomed!
    #virt-manager

    distrobox # other distros integrated into terminal
    boxbuddy # unofficial gui for distrobox
  ];

  # distrobox
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  #boot.binfmt.emulatedSystems = [ "aarch64-linux" ]; # emulate other architectures

  # QEMU
  #boot.binfmt.emulatedSystems = [ "aarch64-linux" "riscv64-linux" ];


  # virtualbox
#  virtualisation.virtualbox = {
#    host.enable = true;
#    #host.enableExtensionPack = true; # unfree :(
#    guest.enable = true;
#    guest.dragAndDrop = true;
#    guest.clipboard = true;
#  };

#  users.extraGroups.vboxusers.members = [ "slips" ];


  #nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  #  "Oracle_VM_VirtualBox_Extension_Pack"
  #];

#  virtualisation.libvirtd = {
#    enable = true;
#    qemu = {
#      package = pkgs.qemu_kvm;
#      runAsRoot = true;
#      swtpm.enable = true;
#      ovmf = {
#        enable = true;
#        packages = [(pkgs.OVMF.override {
#          secureBoot = true;
#          tpmSupport = true;
#        }).fd];
#      };
#    };
#  };

}
