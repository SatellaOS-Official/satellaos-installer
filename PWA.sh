#!/bin/bash

ICON_DIR="/usr/share/SatellaOS/application-icon"
APP_DIR="$HOME/.local/share/applications"

mkdir -p "$APP_DIR"

# ----- Kullanıcıya mod seçtir -----
echo "PWA Kurulum Modu:"
echo "1) Hepsine Evet"
echo "2) Hepsine Hayır"
echo "3) Her uygulama için sor (e/h)"
read -p "Seçiminiz (1/2/3): " MODE

create_pwa() {
    NAME="$1"
    URL="$2"
    ICON="$3"
    FILE="$APP_DIR/${NAME,,}-pwa.desktop"

    # --- Mod 1: Tümü Evet ---
    if [[ "$MODE" == "1" ]]; then
        ANSWER="e"
    # --- Mod 2: Tümü Hayır ---
    elif [[ "$MODE" == "2" ]]; then
        ANSWER="h"
    # --- Mod 3: Sırayla sor ---
    else
        read -p "$NAME yüklensin mi? (e/h): " ANSWER
    fi

    case "$ANSWER" in
        e|E|y|Y)
            cat <<EOF > "$FILE"
[Desktop Entry]
Name=$NAME
Exec=brave-browser --app=$URL
Icon=$ICON_DIR/$ICON
Terminal=false
Type=Application
Categories=Network;WebBrowser;
StartupNotify=true
EOF
            echo "$NAME PWA oluşturuldu → $FILE"
            ;;
        *)
            echo "$NAME atlandı."
            ;;
    esac
}

# ------------------ PWA UYGULAMA LİSTESİ ---------------------

create_pwa "Animecix"       "https://animecix.tv/"                       "Animecix.png"
create_pwa "YouTube"        "https://www.youtube.com/"                  "Youtube.png"
create_pwa "Gmail"          "https://mail.google.com/mail/"             "Gmail.png"
create_pwa "Google Drive"   "https://drive.google.com/drive/my-drive"   "Google-Drive.png"
create_pwa "Google Maps"    "https://www.google.com/maps/"              "Google-Maps.png"
create_pwa "Google Keep"    "https://keep.google.com/"                  "Google-Keep.png"
create_pwa "Copilot"        "https://copilot.microsoft.com/"            "copilot.png"
create_pwa "Gemini"         "https://gemini.google.com/"                "gemini.png"
create_pwa "DeepSeek"       "https://chat.deepseek.com/"                "deepseek.png"
create_pwa "ChatGPT"        "https://chatgpt.com/"                      "chatgpt-dark.png"
create_pwa "GitHub"         "https://github.com/"                       "github-dark.png"

echo "--------------------------------------"
echo "PWA kurulumu tamamlandı!"
