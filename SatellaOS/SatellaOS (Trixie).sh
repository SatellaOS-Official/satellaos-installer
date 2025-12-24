#!/bin/bash

# XFCE masaüstü ortamı ve temel araçların kurulumu
echo "XFCE ve temel paketler kuruluyor..."
sudo apt update

sudo apt install --no-install-recommends -y \
  xfce4 \
  xfce4-appfinder \
  xfce4-battery-plugin \
  xfce4-clipman \
  xfce4-clipman-plugin \
  xfce4-datetime-plugin \
  xfce4-docklike-plugin \
  xfce4-indicator-plugin \
  xfce4-panel \
  xfce4-panel-profiles \
  xfce4-power-manager \
  xfce4-power-manager-data \
  xfce4-power-manager-plugins \
  xfce4-pulseaudio-plugin \
  xfce4-session \
  xfce4-settings \
  xfce4-screenshooter \
  xfce4-terminal \
  xfce4-whiskermenu-plugin \
  xfce4-screensaver \
  xfce4-notifyd \
  vlc \
  grub-customizer \
  qbittorrent \
  thunar \
  mousepad \
  engrampa \
  xorg \
  dbus-x11 \
  x11-xserver-utils \
  lightdm \
  slick-greeter \
  lightdm-settings \
  network-manager \
  network-manager-gnome \
  ntfs-3g \
  pulseaudio \
  pavucontrol \
  alsa-utils \
  galculator \
  gvfs \
  gvfs-backends \
  gvfs-fuse \
  mtp-tools \
  jmtpfs \
  xfwm4 \
  xfdesktop4

# Lightdm Config
echo "Lightdm Yapılandırması..."

sudo mkdir -p /etc/lightdm/lightdm.conf.d/
sudo bash -c 'cat > /etc/lightdm/lightdm.conf.d/10-slick.conf << "EOF"
[Seat:*]
greeter-session=slick-greeter
EOF'

# Unrar
echo "Arşiv Yöneticisi Kuruluyor..."
sudo apt install unrar

# İnternet Tarayıcısı
echo "İnternet Tarayıcısı Kuruluyor..."
curl -fsS https://dl.brave.com/install.sh | sh

# Xfce Özelleştirme
echo "Xfce Özelleştirme Kuruluyor..."
sudo apt install --no-install-recommends -y menulibre

sudo apt install -y \
  fonts-noto \
  fonts-noto-extra \
  fonts-noto-cjk \
  fonts-noto-color-emoji \
  fonts-symbola \
  fonts-unifont \
  fonts-dejavu \
  fonts-liberation \
  fonts-nanum \
  fonts-unfonts-core \
  fonts-ipafont-mincho \
  fonts-ipafont-gothic \
  fonts-takao \
  fonts-wqy-zenhei \
  fonts-arphic-ukai \
  fonts-arphic-uming \
  fonts-bebas-neue \
  fonts-montserrat

# Politika yöneticileri
echo "Politika yöneticileri kuruluyor..."
sudo apt install --no-install-recommends -y \
  mate-polkit \
  polkitd \
  pkexec

# Disk Araçları
echo "Disk Araçları kuruluyor..."
sudo apt install --no-install-recommends -y gnome-disk-utility

# Karakter Haritaları
echo "Karakter Haritaları kuruluyor..."
sudo apt install --no-install-recommends -y gucharmap

# Fotoğraf Görüntüleyici Yamaları
echo "Fotoğraf Görüntüleyici Yamaları kuruluyor..."
sudo apt install --no-install-recommends -y \
  ristretto \
  libwebp7 \
  tumbler \
  tumbler-plugins-extra \
  webp-pixbuf-loader

# Tema ve Simge Paketleri
echo "Tema ve Simge Paketleri kuruluyor..."
sudo apt install --no-install-recommends -y \
  adwaita-qt \
  gnome-themes-extra \
  bibata-cursor-theme

# Flatpak ve Flathub
echo "Flatpak ve Flathub kuruluyor..."
sudo apt install -y flatpak && flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Kurulum tamamlandı. Sistemi yeniden başlatmanız önerilir."
