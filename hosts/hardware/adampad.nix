{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  zramSwap.enable = true;

  security.rtkit.enable = true;
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        libva
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
}
