{ config, pkgs, lib, ... }:

{

  systemd.timers."sleep-time" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "sleep-time.service";
    };
  };

  systemd.services."sleep-time" = {
    script = ''
      shutdown -h 03:00
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };

}
