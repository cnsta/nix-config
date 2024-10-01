{systemModules, ...}: {
  imports = [
    "${systemModules}/boot/loader"
    "${systemModules}/boot/kernel"
    "${systemModules}/gaming/gamemode"
    "${systemModules}/gaming/gamescope"
    "${systemModules}/gaming/lutris"
    "${systemModules}/gaming/steam"
    "${systemModules}/gui/gnome"
    "${systemModules}/gui/hyprland"
    "${systemModules}/hardware/bluetooth"
    "${systemModules}/hardware/graphics/amd"
    "${systemModules}/hardware/graphics/nvidia"
    "${systemModules}/hardware/logitech"
    "${systemModules}/hardware/network"
    "${systemModules}/nix/nh"
    "${systemModules}/studio/blender"
    "${systemModules}/studio/gimp"
    "${systemModules}/studio/inkscape"
    "${systemModules}/studio/beekeeper"
    "${systemModules}/studio/mysql-workbench"
    "${systemModules}/sysd/network/blueman"
    "${systemModules}/sysd/network/mullvad"
    "${systemModules}/sysd/network/samba"
    "${systemModules}/sysd/network/openssh"
    "${systemModules}/sysd/security/agenix"
    "${systemModules}/sysd/security/gnome-keyring"
    "${systemModules}/sysd/session/dbus"
    "${systemModules}/sysd/session/dconf"
    "${systemModules}/sysd/session/xserver"
    "${systemModules}/sysd/system/fwupd"
    "${systemModules}/sysd/system/greetd"
    "${systemModules}/sysd/system/gvfs"
    "${systemModules}/sysd/system/locate"
    "${systemModules}/sysd/system/nix-ld"
    "${systemModules}/sysd/system/pcscd"
    "${systemModules}/sysd/system/pipewire"
    "${systemModules}/sysd/system/powerd"
    "${systemModules}/sysd/system/udisks"
    "${systemModules}/sysd/system/zram"
    "${systemModules}/sysd/system/kanata"
    "${systemModules}/utils/android"
    "${systemModules}/utils/anyrun"
    "${systemModules}/utils/brightnessctl"
    "${systemModules}/utils/chaotic"
    "${systemModules}/utils/corectrl"
    "${systemModules}/utils/microfetch"
    "${systemModules}/utils/misc"
    "${systemModules}/utils/npm"
    "${systemModules}/utils/obsidian"
    "${systemModules}/utils/yubikey"
  ];
}
