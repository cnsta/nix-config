{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  system,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.users.cnst = {
    isNormalUser = true;
    shell = pkgs.zsh;
    # openssh.authorizedKeys.keys = [];
    extraGroups = ifTheyExist [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "git"
      "mysql"
      "docker"
      "libvirtd"
      "network"
      "gamemode"
    ];
  };

  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../core
    ../extra/steam
    ../extra/nix-ld
    ../extra/workstation
    ../extra/gamemode
    ../services/cnix.nix
    ../services/pipewire.nix
    ../hardware/cnix.nix
    ../locale/cnix.nix
    ./hardware-configuration.nix
  ];

  home-manager.users.cnst = import ../../home/cnst/home.nix;
  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      auto-optimise-store = lib.mkDefault true;
      warn-dirty = false;
      # Enable flakes and new 'nix' command
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # Bootloader
  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    efi.canTouchEfiVariables = true;
  };
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
  # Enable networking
  networking = {
    networkmanager.enable = true;
    hostName = "cnix";
  };

  # Garbage collector / Nix helper
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/cnst/.nix-config";
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
