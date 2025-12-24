#!/bin/bash
# Radeon Vega 3 Graphics için Debian 12 sürücü kurulumu
# Script: amd_vega3_setup.sh

set -e  # Hata durumunda scripti durdur

echo "=== 1. Sistem güncelleniyor... ==="
sudo apt update && sudo apt upgrade -y

echo "=== 2. Gerekli paketler kuruluyor... ==="
sudo apt install -y firmware-amd-graphics \
                    mesa-vulkan-drivers \
                    mesa-va-drivers \
                    mesa-vdpau-drivers

echo "=== 3. Kurulum tamamlandı. ==="
echo "Sürücünün aktif olduğunu kontrol etmek için şu komutu çalıştırabilirsiniz:"
echo "    lspci -k | grep -EA3 'VGA|3D'"
echo "Ayrıca donanım hızlandırmayı kontrol etmek için:"
echo "    glxinfo | grep 'OpenGL renderer'"

echo "Kurulum tamamlandı. Yeniden başlatmak için 'sudo reboot' komutunu kullanabilirsiniz."
