{userModules, ...}: {
  imports = [
    "${userModules}/browsers/chromium"
    "${userModules}/browsers/firefox"
    "${userModules}/comm/discord"
    "${userModules}/devtools/neovim"
    "${userModules}/devtools/vscode"
    "${userModules}/gaming/lutris"
    "${userModules}/gaming/mangohud"
    "${userModules}/terminal/alacritty"
    "${userModules}/terminal/foot"
    "${userModules}/terminal/kitty"
    "${userModules}/terminal/zellij"
    "${userModules}/userd/copyq"
    "${userModules}/userd/mako"
    "${userModules}/userd/sops"
    "${userModules}/userd/udiskie"
    "${userModules}/utils/ags"
    "${userModules}/utils/anyrun"
    "${userModules}/utils/misc"
    "${userModules}/utils/rofi"
    "${userModules}/utils/waybar"
    "${userModules}/utils/yazi"
    "${userModules}/wm/hyprland"
    "${userModules}/wm/utils/hypridle"
    "${userModules}/wm/utils/hyprlock"
    "${userModules}/wm/utils/hyprpaper"
  ];
}
