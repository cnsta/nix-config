{pkgs, ...}: {
  imports = [
    ./barbar.nix
    ./comment.nix
    ./efm.nix
    # ./floaterm.nix
    # ./harpoon.nix
    ./lsp.nix
    ./lualine.nix
    ./markdown-preview.nix
    ./neo-tree.nix
    ./startify.nix
    ./tagbar.nix
    ./telescope.nix
    ./treesitter.nix
    ./chatgpt.nix
    # ./vimtex.nix
    ./nonels.nix
    ./conform.nix
    # ./yanky.nix
  ];

  programs.nixvim = {
    extraPlugins = [pkgs.vimPlugins.gruvbox-material];
    colorscheme = "gruvbox-material";

    plugins = {
      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      nvim-autopairs.enable = true;

      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      oil.enable = true;

      trim = {
        enable = true;
        settings = {
          highlight = false;
          ft_blocklist = [
            "checkhealth"
            "floaterm"
            "lspinfo"
            "neo-tree"
            "TelescopePrompt"
          ];
        };
      };
    };
  };
}
