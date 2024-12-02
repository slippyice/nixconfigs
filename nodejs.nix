{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (nodejs_20.withPackages(njs: with njs; [
      nodePackages.npm
      nodePackages.http
      nodePackages.socket.io
      nodePackages.express
    ]))
  ];
}
