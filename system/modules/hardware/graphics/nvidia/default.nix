{
  pkgs,
  config,
  lib,
  ...
}: let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    export __ELECTRON_OZONE_PLATFORM_HINT=auto
    exec "$@"
  '';
  inherit (lib) types mkIf mkEnableOption mkOption;
  cfg = config.modules.hardware.graphics.nvidia;
in {
  options = {
    modules.hardware.graphics.nvidia = {
      enable = mkEnableOption "Enables NVidia graphics";
      package = mkOption {
        type = types.enum ["stable" "beta" "production" "latest"];
        default = "stable";
        description = "Choose between the stable, beta, latest, or production NVidia driver package";
      };
    };
  };

  config = mkIf cfg.enable {
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          nvidia-offload
          libva
          vaapiVdpau
          libvdpau-va-gl
          intel-media-driver
          nvidia-vaapi-driver
          nvidia-offload
          vulkan-tools
          egl-wayland
        ];
        extraPackages32 = with pkgs.pkgsi686Linux; [
          vaapiVdpau
          libvdpau-va-gl
        ];
      };
      nvidia = {
        package =
          if cfg.package == "beta"
          then config.boot.kernelPackages.nvidiaPackages.beta
          else if cfg.package == "latest"
          then config.boot.kernelPackages.nvidiaPackages.latest
          else if cfg.package == "production"
          then config.boot.kernelPackages.nvidiaPackages.prodution
          else config.boot.kernelPackages.nvidiaPackages.stable;
        modesetting.enable = true;
        powerManagement = {
          enable = false;
          finegrained = false;
        };
        open = true;
        nvidiaSettings = true;
      };
    };
  };
}
