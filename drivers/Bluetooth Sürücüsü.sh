#!/bin/bash

# Debian 12 XFCE Bluetooth kurulumu ve başlatılması

echo "Paket listesi güncelleniyor..."
sudo apt update

echo "Bluetooth ve BlueZ kuruluyor..."
sudo apt install -y bluetooth bluez

echo "Blueman kuruluyor (XFCE GUI için)..."
sudo apt install -y blueman

echo "Bluetooth servisi etkinleştiriliyor ve başlatılıyor..."
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

echo "Bluetooth servisi durumu:"
systemctl status bluetooth
