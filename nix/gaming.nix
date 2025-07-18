{ pkgs, lib, ... }:
{
    environment.systemPackages = with pkgs;[
        discord-ptb
    ];
    programs.steam = {
      enable = true;
      # remotePlay.openFirewall=true; #open ports for steam remote play - might not need
      # dedicatedServer.openFirewall = true; # Open ports in the firewall for steam server
      extraCompatPackages = [ pkgs.proton-ge-bin];
    };
}
