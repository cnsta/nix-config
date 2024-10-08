{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.sysd.network.mullvad;
in {
  options = {
    modules.sysd.network.mullvad.enable = mkEnableOption "Enables mullvad";
  };
  config = mkIf cfg.enable {
    services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };
}
