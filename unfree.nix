{ config, pkgs, lib, ...}:

{

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam-original"
    "steam-run"
    "steam-unwrapped"

    "dwarf-fortress"

    "iscan"
    "iscan-gt-f720-bundle"
    "iscan-gt"
    "iscan-nt-bundle"
    "iscan-gt-s650-bundle"
    "iscan-gt-s80-bundle"
    "iscan-v330-bundle"
    "iscan-v370-bundle"
    "iscan-perfection-v550-bundle"
    "iscan-gt-x820-bundle"
    "iscan-gt-x750-bundle"
    "iscan-gt-x770-bundle"
    "iscan-data"];}
