#!/bin/bash

# Tap-to-click özelliğini etkinleştir
echo "👉 Touchpad tapping konfigürasyonu uygulanıyor..."
sudo mkdir -p /etc/X11/xorg.conf.d

sudo tee /etc/X11/xorg.conf.d/40-libinput.conf > /dev/null <<EOF
Section "InputClass"
  Identifier "libinput touchpad catchall"
  MatchIsTouchpad "on"
  MatchDevicePath "/dev/input/event*"
  Driver "libinput"
  Option "Tapping" "on"
EndSection
EOF

echo "✅ Tap-to-click başarıyla etkinleştirildi!"
