{userModules, ...}: {
  imports = [
    "${userModules}/browsers/chromium"
    "${userModules}/browsers/firefox"
    "${userModules}/comm/discord"
    "${userModules}/devtools/neovim"
    "${userModules}/devtools/vscode"
    "${userModules}/devtools/helix"
    "${userModules}/gaming/lutris"
    "${userModules}/gaming/mangohud"
    "${userModules}/terminal/alacritty"
    "${userModules}/terminal/foot"
    "${userModules}/terminal/kitty"
    "${userModules}/terminal/wezterm"
    "${userModules}/terminal/zellij"
    "${userModules}/userd/copyq"
    "${userModules}/userd/mako"
    "${userModules}/userd/udiskie"
    "${userModules}/utils/anyrun"
    "${userModules}/utils/misc"
    "${userModules}/utils/rofi"
    "${userModules}/utils/waybar"
    "${userModules}/utils/yazi"
    "${userModules}/utils/zathura"
    "${userModules}/wm/hyprland"
    "${userModules}/wm/utils/hypridle"
    "${userModules}/wm/utils/hyprlock"
    "${userModules}/wm/utils/hyprpaper"
  ];
}
