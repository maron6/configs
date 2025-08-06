{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    discord-ptb
    bluez
    bluetui # Depends on having bluez installed. See https://github.com/pythops/bluetui
    # Also for bluetui - see '?' for help, but keybindings are also defined in $HOME/.config/bluetui/config.toml
  ];
  programs.steam = {
    enable = true;
    # remotePlay.openFirewall=true; #open ports for steam remote play - might not need
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for steam server
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };
  # Enable bluetooth for ps5 controller
  hardware.bluetooth.enable = true;

  # services.blueman.enable = true; # optional service for managing bluetooth pairing.
  # Probably not needed - depends on DE
}
