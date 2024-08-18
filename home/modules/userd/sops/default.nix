{
  inputs,
  self,
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption mkOption;
  cfg = config.modules.userd.sops;
in {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  options = {
    modules.userd.sops = {
      enable = mkEnableOption "Enables sops home environment";
      cnst = mkOption {
        type = lib.types.bool;
        default = false;
        description = "Apply cnst sops settings";
      };
      toothpick = mkOption {
        type = lib.types.bool;
        default = false;
        description = "Apply toothpick sops settings";
      };
      adam = mkOption {
        type = lib.types.bool;
        default = false;
        description = "Apply adam sops settings";
      };
    };
  };

  config = mkIf cfg.enable {
    sops = lib.mkMerge [
      {
        gnupg = {
          home = "~/.gnupg";
          sshKeyPaths = [];
        };
      }
      (mkIf cfg.cnst {
        age = {sshKeyPaths = ["/home/cnst/.ssh/id_ed25519"];};
        secrets = {
          openai_api_key = {
            format = "yaml";
            sopsFile = "${self}/secrets/cnst-secrets.yaml";
          };
          ssh_user = {
            format = "yaml";
            sopsFile = "${self}/secrets/cnst-secrets.yaml";
          };
        };
      })
      (mkIf cfg.toothpick {
        age = {sshKeyPaths = ["/home/toothpick/.ssh/id_ed25519"];};
        secrets = {
          openai_api_key = {
            format = "yaml";
            sopsFile = "${self}/secrets/toothpick-secrets.yaml";
          };
          ssh_user = {
            format = "yaml";
            sopsFile = "${self}/secrets/toothpick-secrets.yaml";
          };
        };
      })
      (mkIf cfg.adam {
        age = {sshKeyPaths = ["/home/adam/.ssh/id_ed25519"];};
        secrets = {
          openai_api_key = {
            format = "yaml";
            sopsFile = "${self}/secrets/adam-secrets.yaml";
          };
          ssh_user = {
            format = "yaml";
            sopsFile = "${self}/secrets/adam-secrets.yaml";
          };
        };
      })
    ];
  };
}
