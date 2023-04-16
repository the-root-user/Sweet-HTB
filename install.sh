#!/bin/bash
echo ""
echo "┌────────────────────────────────────────┐"
# │
echo ""
echo "   Sweet-HTB - Modern theme for Hackers  "
echo ""
echo "   @therootuser_  "
# echo ""
# echo "  Fork of Sweet-Mars, Layan, WhiteSur & Ocean themes"
echo ""
echo "└────────────────────────────────────────┘"
echo ""
sleep 0.6

if [[ $EUID -eq 0 ]]; then
    sleep 0.5; echo -e "[-] Please execute the script as normal user (without sudo). "
    exit
fi

echo "┌─ Installing.."
if [ -d aurorae/Sweet-HTB ]; then
    sleep 0.2; echo -e "├── aurorae theme "
    if ! [ -d $HOME/.local/share/aurorae/themes/ ]; then
        mkdir -p $HOME/.local/share/aurorae/themes/
    fi
    cp aurorae/Sweet-HT* $HOME/.local/share/aurorae/themes/ -r
fi

if [ -f color-schemes/SweetHTB.colors ]; then
    sleep 0.2; echo -e "├── color scheme "
    if ! [ -d $HOME/.local/share/color-schemes/ ]; then
        mkdir -p $HOME/.local/share/color-schemes/
    fi
    cp color-schemes/SweetHTB.colors $HOME/.local/share/color-schemes/SweetHTB.colors
fi

if [ -f Kwrite-HTB.theme ]; then
    # sleep 0.2; echo -e "├── editor theme "
    if ! [ -d $HOME/.local/share/org.kde.syntax-highlighting/themes/ ]; then
        mkdir -p $HOME/.local/share/org.kde.syntax-highlighting/themes/
    fi
    cp Kwrite-HTB.theme $HOME/.local/share/org.kde.syntax-highlighting/themes/Kwrite-HTB.theme
fi

if [ -d Kvantum/Sweet-HTB ]; then
    sleep 0.2; echo -e "├── kvantum theme "
    if ! [ -d $HOME/.config/Kvantum/ ]; then
        mkdir -p $HOME/.config/Kvantum/
    fi
    cp Kvantum/Sweet-HTB $HOME/.config/Kvantum/ -r
fi

if [ -d desktoptheme/Sweet-HTB ]; then
    sleep 0.2; echo -e "├── desktop theme "
    if ! [ -d $HOME/.local/share/plasma/desktoptheme/ ]; then
        mkdir -p $HOME/.local/share/plasma/desktoptheme/
    fi
    cp desktoptheme/Sweet-HTB $HOME/.local/share/plasma/desktoptheme/ -r
    if [ -d desktoptheme/Sweet-HTB-alt ]; then
        cp desktoptheme/Sweet-HTB-alt $HOME/.local/share/plasma/desktoptheme/ -r
    fi
fi

if [ -d look-and-feel/Sweet-HTB ]; then
    sleep 0.2; echo -e "├── login/splash theme "
    if ! [ -d $HOME/.local/share/plasma/look-and-feel/ ]; then
        mkdir -p $HOME/.local/share/plasma/look-and-feel/
    fi
    cp look-and-feel/Sweet-HTB $HOME/.local/share/plasma/look-and-feel/ -r
fi

if [ -f konsole/Sweet-HTB.profile ]; then
    sleep 0.2; echo -e "├── konsole theme "
    if ! [ -d $HOME/.local/share/konsole/ ]; then
        mkdir -p $HOME/.local/share/konsole/
    fi
    cp konsole/Sweet-HTB.profile $HOME/.local/share/konsole/Sweet-HTB.profile
    if [ -f konsole/Konsole-HTB.colorscheme ]; then
        cp konsole/Konsole-HTB.colorscheme $HOME/.local/share/konsole/Konsole-HTB.colorscheme
    fi
fi

if [ -d wallpapers/Sweet-HTB ]; then
    sleep 0.2; echo -e "├── wallpapers "
    if ! [ -d $HOME/.local/share/wallpapers/ ]; then
        mkdir -p $HOME/.local/share/wallpapers/
    fi
    cp wallpapers/Sweet-HTB $HOME/.local/share/wallpapers/ -r
    if [ -d wallpapers/Sweet-Wallpapers ]; then
        cp wallpapers/Sweet-Wallpapers $HOME/.local/share/wallpapers/ -r
    fi
fi

# if ! [ -d $HOME/.local/share/icons/WhiteSur ]; then
#     sleep 0.5; echo -e "├─ Icon theme installation aborted."
#     echo -e "│   WhiteSur icon theme not found, please install it."
# else
#     if [ -d WhiteSur ]; then
#         sleep 0.2; echo -e "├── icon theme "
#         cp WhiteSur $HOME/.local/share/icons/ -r > /dev/null
#         if [ -d WhiteSur/actions ]; then
#             cp WhiteSur/actions $HOME/.local/share/icons/WhiteSur-dark -r
#         fi
#         if [ -d WhiteSur/places/symbolic ]; then
#             cp WhiteSur/places/symbolic $HOME/.local/share/icons/WhiteSur-dark/places -r
#         fi
#     fi
# fi

if [[ $1 = 'sddm' ]]; then
    if [ -d sddm/Sweet-HTB ]; then
        sleep 0.2; echo -e "├── sddm theme "
        if ! [[ $EUID -eq 0 ]]; then
            echo -e "│      Please provide "
        fi
        if ! [ -d /usr/share/sddm/themes/ ]; then
            sudo mkdir -p /usr/share/sddm/themes/
        fi
        sudo cp sddm/Sweet-HT* /usr/share/sddm/themes/ -r
    fi
elif [[ $1 = '' ]]; then
    sleep 0.2; echo -e "│\n├─ If you want to install sddm theme, execute "
    echo -e "│    $0 sddm"
fi

sleep 0.5
echo -e "│\n└─ Installation done."

sleep 1
echo " "
echo -ne "┌─ Do You want to apply the theme? "
read REPLY;
if [[ "$REPLY" =~ ^[y/Y]$ ]]; then
    echo -ne "├─ Applying theme"
    sleep 0.3; echo -ne ".";
    lookandfeeltool -a Sweet-HTB 2> /dev/null
    sleep 0.3; echo -ne "."; sleep 0.3; echo -ne ". ";
    sleep 0.5; echo -e "Applied."
else
    echo -ne "├─ Ok"
    sleep 0.3; echo -ne ".. "
    sleep 0.3; echo -ne "OK! "
    sleep 0.5; echo -e "I'm not tampering with your settings. "
fi
sleep 1
echo -e "│\n└─ Job done, Bye."
