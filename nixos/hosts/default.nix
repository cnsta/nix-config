{
  self,
  inputs,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    # shorten paths
    inherit (inputs.nixpkgs.lib) nixosSystem;
    mod = "${self}/nixos";

    # get the basic config to build on top of
    inherit (import "${self}/nixos") desktop laptop;

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
    cnix = nixosSystem {
      inherit specialArgs;
      modules =
        desktop
        ++ [
          ./cnix
          "${mod}/core"
          "${mod}/core/lanzaboote.nix"
          "${mod}/core/network/cnix.nix"

          "${mod}/hardware/cnix.nix"

          "${mod}/services/blueman"
          "${mod}/services/xserver/cnix.nix"

          "${mod}/extra/gaming.nix"
          "${mod}/extra/android"
          "${mod}/extra/workstation"
          {
            home-manager = {
              users.cnst.imports = homeImports."cnst@cnix";
              extraSpecialArgs = specialArgs;
            };
          }

          # inputs.agenix.nixosModules.default
          inputs.chaotic.nixosModules.default
        ];
    };
    toothpc = nixosSystem {
      inherit specialArgs;
      modules =
        desktop
        ++ [
          ./toothpc
          "${mod}/core"
          "${mod}/core/lanzaboote.nix"
          "${mod}/core/network/toothpc.nix"

          "${mod}/hardware/toothpc.nix"

          "${mod}/services/xserver/toothpc.nix"

          "${mod}/extra/gaming.nix"
          "${mod}/extra/android"
          "${mod}/extra/workstation"
          {
            home-manager = {
              users.toothpick.imports = homeImports."toothpick@toothpc";
              extraSpecialArgs = specialArgs;
            };
          }

          # inputs.agenix.nixosModules.default
          inputs.chaotic.nixosModules.default
        ];
    };
    adampad = nixosSystem {
      inherit specialArgs;
      modules =
        laptop
        ++ [
          ./adampad
          "${mod}/core"
          "${mod}/core/network/adampad.nix"

          "${mod}/hardware/adampad.nix"

          "${mod}/services/xserver/adampad.nix"
          "${mod}/services/blueman"

          "${mod}/extra/android"
          {
            home-manager = {
              users.adam.imports = homeImports."adam@adampad";
              extraSpecialArgs = specialArgs;
            };
          }

          # inputs.agenix.nixosModules.default
          inputs.chaotic.nixosModules.default
        ];
    };
  };
}
