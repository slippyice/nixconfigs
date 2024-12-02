{ config, pkgs, ... }:

{
  ##### REQUIRED FOR ODD SOUND CARD #####
  #boot.kernelParams = [ "snd_hda_intel.dmic_detect=0" ];
  boot.kernelParams = [ "snd-intel-dspcfg.dsp_driver=1" ];
  
  #boot.kernelParams = [
  #  "snd-intel-dspcfg.dsp_driver=3"
  #  "snd_rn_pci_acp3x.dmic_acpi_check"
  #  "snd_sof_intel_hda_common.hda_model=alc255-acer"
  #];
  #boot.kernelModules = [ "snd_soc_skl_hda_dsp" "skl_hda_dsp_generic" ];
  #boot.extraModprobeConfig = ''
  #  options snd_sof_intel_hda_common hda_model=alc255-acer
  #'';
  
  #boot.kernelParams = [ "snd-intel-dspcfg.dsp_driver=3" ];
  #boot.kernelModules = [ pkgs.sof-firmware ];
  #hardware.firmware = [ pkgs.sof-firmware ];
  #hardware.enableRedistributableFirmware = true;
  #hardware.enableAllFirmware = true;
  #boot.extraModulePackages = [ pkgs.sof-firmware ];

  #boot.extraModulePackages = with config.boot.kernelPackages; [ pkgs.sof-firmware ];

  #hardware.enableRedistributableFirmware = true;
  #hardware.enableAllFirmware = true;
  #nixpkgs.config.allowUnfree = true;
  #hardware.firmware = with pkgs; [
  #  sof-firmware
  #  alsa-firmware
  #];
}
