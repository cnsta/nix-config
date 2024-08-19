{ lib
, config
, ...
}:
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.devtools.neovim.plugins.harpoon;
in
{
  options = {
    modules.devtools.neovim.plugins.harpoon.enable = mkEnableOption "Enables Harpoon plugin for Neovim";
  };

  config = mkIf cfg.enable {
    programs.nixvim.plugins.harpoon = {
      enable = true;

      keymapsSilent = true;

      keymaps = {
        addFile = "<leader>a";
        toggleQuickMenu = "<C-e>";
        navFile = {
          "1" = "<C-j>";
          "2" = "<C-k>";
          "3" = "<C-l>";
          "4" = "<C-m>";
        };
      };
    };
  };
}
