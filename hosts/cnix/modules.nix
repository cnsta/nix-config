{
  modules = {
    gaming = {
      steam = {
        enable = true;
      };
      gamescope = {
        enable = true;
      };
      lutris = {
        enable = true;
      };
      gamemode = {
        enable = true;
        optimizeGpu = {
          enable = true;
        };
      };
    };
    gui = {
      gnome = {
        enable = false;
      };
      hyprland = {
        enable = true;
      };
    };
    hardware = {
      bluetooth = {
        enable = true;
      };
      logitech = {
        enable = true;
      };
      graphics = {
        amd = {
          enable = true;
        };
        nvidia = {
          enable = false;
        };
      };
      network = {
        enable = true;
        hostName = "cnix";
        interfaces = {
          "enp7s0" = {
            allowedTCPPorts = [22 80 443];
          };
        };
      };
    };
    studio = {
      blender = {
        enable = false;
        hip = {
          enable = false;
        };
      };
      gimp = {
        enable = true;
      };
      inkscape = {
        enable = true;
      };
    };
    sysd = {
      blueman = {
        enable = true;
      };
      dbus = {
        enable = true;
      };
      fwupd = {
        enable = true;
      };
      gnome-keyring = {
        enable = true;
      };
      greetd = {
        enable = true;
      };
      gvfs = {
        enable = true;
      };
      locate = {
        enable = true;
      };
      mullvad = {
        enable = true;
      };
      pipewire = {
        enable = true;
      };
      powerd = {
        enable = true;
      };
      samba = {
        enable = false;
      };
      ssh = {
        enable = true;
      };
      udisks = {
        enable = true;
      };
      pcscd = {
        enable = true;
      };
      xserver = {
        amd = {
          hhkbse = {
            enable = true;
          };
        };
      };
    };
    utils = {
      agenix = {
        enable = true;
        cnix = {
          enable = true;
        };
      };
      android = {
        enable = true;
      };
      anyrun = {
        enable = true;
      };
      corectrl = {
        enable = true;
      };
      microfetch = {
        enable = true;
      };
      nix-ld = {
        enable = false;
      };
      misc = {
        enable = true;
      };
      npm = {
        enable = true;
      };
      yubikey = {
        enable = true;
      };
    };
  };
}
