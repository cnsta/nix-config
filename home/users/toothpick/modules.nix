{
  modules = {
    browsers = {
      firefox.enable = true;
      chromium.enable = false;
    };
    comm = {
      discord.enable = true;
    };
    devtools = {
      neovim.enable = true;
      vscode.enable = true;
    };
    gaming = {
      lutris.enable = false;
      mangohud.enable = false;
    };
    terminal = {
      alacritty.enable = true;
      foot.enable = true;
      kitty.enable = true;
      zellij.enable = false;
    };
    userd = {
      sops.enable = false;
      copyq.enable = true;
      mako.enable = true;
      udiskie.enable = true;
    };
    utils = {
      ags.enable = false;
      anyrun.enable = false;
      rofi.enable = false;
      waybar.enable = true;
      yazi.enable = true;
      misc.enable = true;
    };
    wm = {
      hyprland = {
        cnst.enable = false;
        toothpick.enable = true;
        adam.enable = false;
      };
      utils = {
        hypridle.enable = true;
        hyprlock.enable = true;
        hyprpaper.enable = true;
      };
    };
  };
}
