#!/bin/bash

echo "▶ Autostart dosyası kopyalanıyor..."

mkdir -p "$HOME/.config/autostart"

cp "$HOME/satellaos-installer/autostart/satella-autostart.desktop" \
   "$HOME/.config/autostart/"

chmod +x "$HOME/.config/autostart/satella-autostart.desktop"
chmod +x "$HOME/satellaos-installer/autostart/satella-autostart.sh"

echo "✔ Tamamlandı"
echo "ℹ Değişikliklerin uygulanması için XFCE oturumuna bir kez giriş yapın"
