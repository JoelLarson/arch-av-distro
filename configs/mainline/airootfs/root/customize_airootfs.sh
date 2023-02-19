#!/bin/bash

set -eu

USERNAME="streamer"

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/

chmod 0700 /root

# Ignore hibernation/suspend
sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default multi-user.target

useradd -m -G wheel "${USERNAME}"

passwd "${USERNAME}"

su "${USERNAME}"

pacman -Sy
pacman-key --init
pacman-key --populate archlinux
