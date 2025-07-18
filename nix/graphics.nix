        # Alternatively - see `
{ config, lib, pkgs, ...}:
{
    # see https://nixos.wiki/wiki/Nvidia
    hardware.graphics = {
        enable = true;
    };
    /*
    # Use nvidia drivers instead of openGL
    hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32bit = true;
    }; */

    #load nvidia driver for xorg/wayland
    services.xserver.videoDrivers = [
        "modesetting"
        "nvidia"
    ];

    hardware.nvidia = {
        # Modesetting is required - Enabled above
        # modesetting.enable = true;

        # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
        # Enable this if you have graphical corruption issues or application crashes after waking
        # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
        # of just the bare essentials.
        powerManagement.enable = false;

        # Fine-grained power management. Turns off GPU when not in use.
        # Experimental and only works on modern Nvidia GPUs (Turing or newer).
        powerManagement.finegrained = false;

        # Use the NVidia open source kernel module (not to be confused with the
        # independent third-party "nouveau" open source driver).
        # Support is limited to the Turing and later architectures. Full list of
        # supported GPUs is at:
        # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
        # Only available from driver 515.43.04+
        open = false;

        # Enable the Nvidia settings menu,
        # accessible via `nvidia-settings`.
        nvidiaSettings = true;

        # Optionally, you may need to select the appropriate driver version for your specific GPU.
        package = config.boot.kernelPackages.nvidiaPackages.stable;

        # Based on some details from output of lshw -c display
        # Alternatively - see `nix shell nixpkgs#pciutils -c lspci | grep VGA`
        prime = {
            offload = {
                enable = true;
                enableOffloadCmd = true;
            };
            intelBusId = "PCI:00:02:0";
            nvidiaBusId = "PCI:01:00:0";
        };
    };

}
