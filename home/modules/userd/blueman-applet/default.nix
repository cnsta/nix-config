{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.userd.blueman-applet;
in {
  options = {
    modules.userd.blueman-applet.enable = mkEnableOption "Enables blueman-applet";
  };
  config = mkIf cfg.enable {
    services.blueman-applet = {
      enable = true;
    };
  };
}
