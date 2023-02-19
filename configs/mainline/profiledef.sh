#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="streamer-os"
iso_label="STREAMER_OS_$(date +%Y%m)"
iso_publisher="Joel Larson <https://github.com/JoelLarson>"
iso_application="Streamer OS Live/Rescue CD"
iso_version="$(date +%Y%m%d_%H%M)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
)