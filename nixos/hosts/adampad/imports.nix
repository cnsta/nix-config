{pkgs, ...}: {
  imports = [
    # core
    ../../core/fonts.nix
    ../../core/hyprland.nix
    ../../core/networking.nix
    ../../core/zsh.nix

    # hardware
    ../../hardware/cnix.nix

    # locale
    ../../locale

    # services
    ../../services/blueman
    ../../services/dbus
    ../../services/gnome-keyring
    ../../services/greetd
    ../../services/gvfs
    ../../services/locate
    ../../services/mullvad
    ../../services/openssh
    ../../services/audio
    ../../services/power
    ../../services/samba
    ../../services/udisks
    ../../services/fwupd
    ../../services/xserver/adampad.nix

    # extra
    # ../../extra/gaming.nix
    ../../extra/android
    # ../../extra/workstation
    # ../../extra/nix-ld
  ];

  environment = {
    systemPackages = with pkgs; [
      # Core
      fd
      git
      niv
      nix-output-monitor
      nvd
      sbctl
      rocmPackages.rocm-smi

      # Util
      anyrun
      curl
      fzf
      gnome-disk-utility
      lazygit
      ntfs3g
      p7zip
      ripgrep
      stow
      tmux
      tmuxifier
      tree-sitter
      udiskie
      unrar
      unzip
      wget
      xdg-user-dirs
      xdg-utils

      # Dev
      binutils
      clang
      clang-tools
      cargo-edit
      cargo-insta
      cargo-nextest
      gcc
      gnumake
      cmake
      python3
      python312Packages.httplib2
      python312Packages.oauth2
      gtk3
      gtk4

      # misc.language_servers
      typescript-language-server
      typescript
      nixd
      nil
      statix
      hyprlang
      alejandra
      nixpkgs-fmt
      pyright
      isort
      rustfmt
      rust-analyzer
      clippy
      lua-language-server
      stylua
      nodePackages_latest.nodejs
      nodePackages.prettier
      prettierd
      black
      vimPlugins.nvim-treesitter-parsers.typescript
    ];
  };
}
