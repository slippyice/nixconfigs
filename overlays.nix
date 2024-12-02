{ config, pkgs, lib, ... }:

{

  nixpkgs.overlays = [
    (final: prev:
      {
        dwarf-fortress-packages.dwarf-therapist = prev.dwarf-fortress-packages.dwarf-therapist.overrideAttrs (old: {
          src = prev.fetchFromGitHub {
            owner = "Dwarf-Therapist";
            repo = "Dwarf-Therapist";
            rev = "v41.2.2";
            sha256 = "sha256-zsEG68ioSw64UfmqlTLO1i5sObg8C4zxvdPxdQGMhhU=";
          };
        });
      }
    )
  ];

}
