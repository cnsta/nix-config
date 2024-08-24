{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.devtools.nixvim.plugins.neo-tree;
in {
  options = {
    modules.devtools.nixvim.plugins.neo-tree.enable = mkEnableOption "Enables nix-tree plugin for nixvim";
  };

  config = mkIf cfg.enable {
    programs.nixvim = {
      plugins.neo-tree = {
        enable = true;

        closeIfLastWindow = true;
        window = {
          width = 30;
          autoExpandWidth = true;
        };
      };

      keymaps = [
        {
          mode = "n";
          key = "<leader>n";
          action = ":neotree action=focus reveal toggle<CR>";
          options.silent = true;
        }
      ];
    };
  };
}