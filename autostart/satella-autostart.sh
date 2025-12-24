#!/bin/bash

set -u
set -e   # ❗ Hata olursa script anında durur

export DISPLAY=:0
export XAUTHORITY="$HOME/.Xauthority"

echo "▶ SatellaOS boot script başlatıldı"
sleep 1

echo "▶ GTK teması uygulanıyor..."
xfconf-query -c xsettings -p /Net/ThemeName -s "Fluent-purple-Dark"

echo "▶ XFWM teması uygulanıyor..."
xfconf-query -c xfwm4 -p /general/theme -s "Fluent-purple-Dark"

echo "▶ İkon teması uygulanıyor..."
xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Dark"

echo "▶ Fare teması ayarlanıyor..."
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "Bibata-Modern-Classic"
xfconf-query -c xsettings -p /Gtk/CursorThemeSize -s 24

echo "▶ Panel bekleniyor..."
sleep 3

PANEL_PROFILE="$HOME/satellaos-installer/panel-customization/Debian 13.2.0 Clean.tar.bz2"

if [ -f "$PANEL_PROFILE" ]; then
    echo "▶ Panel profili yükleniyor..."
    xfce4-panel-profiles load "$PANEL_PROFILE"
else
    echo "⚠ Panel profili bulunamadı"
    exit 1   # ❗ Bilinçli hata → pkill çalışmaz
fi

echo "▶ Geçici kurulum dosyaları temizleniyor..."

if [ -d "$HOME/satellaos-installer" ]; then
    rm -rf "$HOME/satellaos-installer"
fi

if [ -f "$HOME/.config/autostart/satella-autostart.desktop" ]; then
    rm -f "$HOME/.config/autostart/satella-autostart.desktop"
fi

echo "✔ SatellaOS boot tamamlandı"

# ✅ SADECE her şey sorunsuzsa buraya gelinir
pkill xfce4-terminal
