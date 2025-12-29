#!/bin/bash

# Installation directory
install_dir="$HOME/Deb Files"
mkdir -p "$install_dir"

echo "Choose the package(s) you want to install:"
echo "1. Steam"
echo "2. Free Download Manager"
echo "3. LocalSend (Deb)"
echo "4. LocalSend (Flatpak)"
echo "5. KDiskMark (Deb)"
echo "6. KDiskMark (Flatpak)"
echo "7. VirtualBox (13)"
echo "8. GIMP (Deb)"
echo "9. GIMP (Flatpak)"
echo "10. Pinta (Flatpak)"
echo "11. PowerISO (Flatpak)"
echo "12. MenuLibre"
echo "13. Sublime Text"
echo "14. WineHQ (Debian 13)"
echo "15. Mission Center"
echo "16. Google Chrome"
echo "17. Opera"
echo "18. Vivaldi"
echo "19. Brave Browser"
echo "20. Firefox ESR"

read -p "Enter the numbers of the packages you want to install (example: 1 4 9): " packages

for package in $packages
do
  case $package in

    1)
      echo "Installing Steam..."
      wget https://cdn.fastly.steamstatic.com/client/installer/steam.deb -O "$install_dir/steam.deb"
      sudo apt install -y "$install_dir/steam.deb"
      ;;

    2)
      echo "Installing Free Download Manager..."
      wget https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb -O "$install_dir/fdm.deb"
      sudo apt install -y "$install_dir/fdm.deb"
      ;;

    3)
      echo "Installing LocalSend (Deb)..."
      wget https://github.com/localsend/localsend/releases/latest/download/LocalSend-linux-x86-64.deb -O "$install_dir/localsend.deb"
      sudo apt install -y "$install_dir/localsend.deb"
      ;;

    4)
      echo "Installing LocalSend (Flatpak)..."
      flatpak install -y flathub org.localsend.localsend_app
      ;;

    5)
      echo "Installing KDiskMark (Deb)..."
      wget https://github.com/JonMagon/KDiskMark/releases/latest/download/kdiskmark_amd64.deb -O "$install_dir/kdiskmark.deb"
      sudo apt install -y "$install_dir/kdiskmark.deb"
      ;;

    6)
      echo "Installing KDiskMark (Flatpak)..."
      flatpak install -y flathub io.github.jonmagon.kdiskmark
      ;;

    7)
      echo "Installing VirtualBox (Debian 13)..."
      wget https://download.virtualbox.org/virtualbox/7.2.4/virtualbox-7.2_7.2.4-170995~Debian~trixie_amd64.deb -O "$install_dir/virtualbox.deb"
      sudo apt install -y "$install_dir/virtualbox.deb"
      ;;

    8)
      echo "Installing GIMP (Deb)..."
      sudo apt install -y gimp
      ;;

    9)
      echo "Installing GIMP (Flatpak)..."
      flatpak install -y flathub org.gimp.GIMP
      ;;

    10)
      echo "Installing Pinta..."
      flatpak install -y flathub com.github.PintaProject.Pinta
      ;;

    11)
      echo "Installing PowerISO..."
      flatpak install -y flathub com.poweriso.PowerISO
      ;;

    12)
      echo "Installing MenuLibre..."
      sudo apt install -y menulibre
      ;;

    13)
      echo "Installing Sublime Text..."
      sudo mkdir -pm755 /etc/apt/keyrings
      wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
      echo -e "Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc" | sudo tee /etc/apt/sources.list.d/sublime-text.sources
      sudo apt update
      sudo apt install -y sublime-text
      ;;

    14)
      echo "Installing WineHQ (Debian 13)..."
      sudo mkdir -pm755 /etc/apt/keyrings
      wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -
      sudo dpkg --add-architecture i386
      sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/trixie/winehq-trixie.sources
      sudo apt update
      sudo apt install -y --install-recommends winehq-stable
      ;;

    15)
      echo "Installing Mission Center..."
      flatpak install -y flathub io.missioncenter.MissionCenter
      ;;

    16)
      echo "Installing Google Chrome..."
      wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O "$install_dir/chrome.deb"
      sudo apt install -y "$install_dir/chrome.deb"
      ;;

    17)
      echo "Installing Opera..."
      wget https://download5.operacdn.com/ftp/pub/opera/desktop/$(curl -s https://get.geo.opera.com/pub/opera/desktop/ | tail -n 1)/linux/opera-stable_amd64.deb -O "$install_dir/opera.deb"
      sudo apt install -y "$install_dir/opera.deb"
      ;;

    18)
      echo "Installing Vivaldi..."
      wget https://downloads.vivaldi.com/stable/vivaldi-stable_amd64.deb -O "$install_dir/vivaldi.deb"
      sudo apt install -y "$install_dir/vivaldi.deb"
      ;;

    19)
      echo "Installing Brave Browser..."
      sudo apt install -y curl
      sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
      sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources
      sudo apt update
      sudo apt install -y brave-browser
      ;;

    20)
      echo "Installing Firefox ESR..."
      sudo apt install -y firefox-esr
      ;;

    *)
      echo "Invalid choice: $package"
      ;;
  esac
done

# Ask if the user wants to delete the deb files
read -p "Do you want to delete the deb files? (Y/N): " delete_choice

if [[ "$delete_choice" =~ ^(Y|y|Yes|yes)$ ]]; then
  echo "Deleting deb files..."
  rm -rf "$install_dir"/*.deb
fi

echo "All selected packages have been installed!"
