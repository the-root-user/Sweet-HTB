#!/bin/bash
LBLUE="\e[38;2;164;177;205;50m"    # Color for #a4b1cd
BLUE="\e[38;2;44;53;68;50m"             # Color for #2c3544
LIME="\e[38;2;159;239;0m"         # Color for #9fef00
echo -e "$LIME"
echo -e "┌─────────────────────────────────────────────┐"
# $LIME│ $LBLUE 
echo -e ""
echo -e "   Sweet-HTB - Sweet theme for Sweet Hackers   "
echo -e ""
echo -e "   Made with ❤️ by Signore                     "
# echo -e ""
# echo -e "  Fork of Sweet-Mars, Layan, WhiteSur & Ocean themes"
echo -e ""
echo -e "└─────────────────────────────────────────────┘"
echo -e ""
sleep 0.6


# Some vars
THEME="Sweet-HTB"
wallpaper_file_name="3840x2160.png"
print(){ sleep 0.2; echo -e $1; }
dir_check(){ dir=$1; [[ ! -d $dir ]] && mkdir -p $dir; }

# modify settings only if installed
kvantum=false
wallpaper=false
sddm_config=false

if [[ $EUID -eq 0 ]]; then
    echo -e "\033[91m[-] Please execute the script as normal user (without sudo). "
    sleep 1
    exit
fi

echo -e "$LIME┌─$LBLUE Installing.."

print "$LIME├──$LBLUE KDE theme "
    if [ -d aurorae/$THEME ]; then
        # print "$LIME├──$LBLUE aurorae theme "
        dir_check $HOME/.local/share/aurorae/themes
        cp aurorae/$THEME* $HOME/.local/share/aurorae/themes/ -r
    fi

    if [ -f color-schemes/$THEME.colors ]; then
        # print "$LIME├──$LBLUE color scheme "
        dir_check $HOME/.local/share/color-schemes
        cp color-schemes/$THEME.colors $HOME/.local/share/color-schemes/$THEME.colors
    fi

    if [ -d desktoptheme/$THEME ]; then
        # print "$LIME├──$LBLUE desktop theme "
        dir_check $HOME/.local/share/plasma/desktoptheme
        cp desktoptheme/$THEME $HOME/.local/share/plasma/desktoptheme/ -r
    fi

    if [ -d look-and-feel/$THEME ]; then
        # print "$LIME├──$LBLUE login/splash theme "
        dir_check $HOME/.local/share/plasma/look-and-feel
        cp look-and-feel/$THEME $HOME/.local/share/plasma/look-and-feel/ -r
        # cp look-and-feel/$THEME/contents/layouts/plasma-org.kde.plasma.desktop-appletsrc ~/.config/
    fi

    if [ -f Kwrite-$THEME.theme ]; then
        # print "$LIME├──$LBLUE editor theme "
        dir_check $HOME/.local/share/org.kde.syntax-highlighting/themes
        cp Kwrite-$THEME.theme $HOME/.local/share/org.kde.syntax-highlighting/themes/Kwrite-$THEME.theme
    fi

    if [ -f konsole/$THEME.profile ]; then
        # print "$LIME├──$LBLUE konsole theme "
        dir_check $HOME/.local/share/konsole
        cp konsole/$THEME.profile $HOME/.local/share/konsole/$THEME.profile
        [ -f konsole/$THEME.colorscheme ] && cp konsole/$THEME.colorscheme $HOME/.local/share/konsole/$THEME.colorscheme
    fi


# done
if [ -d Kvantum/$THEME ]; then
    print "$LIME├──$LBLUE Kvantum theme "
    dir_check $HOME/.config/Kvantum
    cp Kvantum/$THEME $HOME/.config/Kvantum/ -r
    kvantum=true
fi

# done
if [ -d wallpapers/$THEME ]; then
    print "$LIME├──$LBLUE Wallpapers "
    dir_check $HOME/.local/share/wallpapers
    cp wallpapers/* $HOME/.local/share/wallpapers/ -r
    wallpaper=true
fi

if [ -d gtk/$THEME ]; then
    print "$LIME├──$LBLUE GTK theme "
    print "$LIME├──$LBLUE Gnome shell theme "
    dir_check $HOME/.themes
    cp gtk/$THEME $HOME/.themes/ -r
fi

if [ -d libadwaita ]; then
    echo -e "$LIME├──$LBLUE Gnome apps (libadwaita) theme"
    cp -r $HOME/.config/gtk-4.0 $HOME/.config/gtk-4.0.old
    rm -r $HOME/.config/gtk-4.0/*.css
    cp -r libadwaita/* $HOME/.config/gtk-4.0/
fi

# if [ -d icons/$THEME ]; then
#     if [ ! -d $HOME/.local/share/icons/WhiteSur ]; then
#         read -p "$LIME├──$LBLUE WhiteSur icon theme not found. Install it from web? (y/n) " INSTALL
#         if [[ $INSTALL =~ ^[y|Y] ]]; then
#             echo -e "$LIME│ $LBLUE  Installing from web..."
#         else
#             echo -e "$LIME│ $LBLUE  Icons installation aborted. Modifications not made."
#         fi
#     fi

#     if [ -d $HOME/.local/share/icons/WhiteSur ]; then
#         THEME_DIR="$HOME/.local/share/icons/$THEME"
#         sleep 0.2; echo -e "$LIME├──$LBLUE custom icons "
#         [ -d "$THEME_DIR" ] && rm -rf "$THEME_DIR"*
#         cp -r $HOME/.local/share/icons/WhiteSur $THEME_DIR && rm $THEME_DIR/icon-theme.cache
#         cp -r --remove-destination icons/$THEME/* $THEME_DIR

#         sed -i "s/#363636/#ccdcff/g" "${THEME_DIR}"/{actions,devices,places}/{16,22,24}/*            2>/dev/null
#         sed -i "s/#363636/#ccdcff/g" "${THEME_DIR}"/apps/{22,32}/*                                   2>/dev/null
#         sed -i "s/#363636/#ccdcff/g" "${THEME_DIR}"/categories/22/*                                  2>/dev/null
#         sed -i "s/#363636/#ccdcff/g" "${THEME_DIR}"/{actions,devices}/32/*                           2>/dev/null
#         sed -i "s/#363636/#ccdcff/g" "${THEME_DIR}"/{actions,apps,categories,emblems,devices,mimes,places,status}/symbolic/* 2>/dev/null
#         sed -i "s/#f2f2f2/#ccdcff/g" "${THEME_DIR}"/status/{16,22,24,32}/*                           2>/dev/null
#         gtk-update-icon-cache $THEME_DIR # || echo theme1

#         if [ -d icons/alt-folders ]; then
#             cp -r $THEME_DIR $THEME_DIR-alt && rm $THEME_DIR-alt/.icon-theme.cache
#             cp -r icons/alt-folders/* $THEME_DIR-alt/places/scalable
#             sed -i "s/Sweet-HTB/Sweet-HTB-alt/g" $THEME_DIR-alt/index.theme
#             gtk-update-icon-cache $THEME_DIR-alt # || echo theme2
#         fi
#     fi
# fi

if [ -d plank/$THEME ]; then
    print "$LIME├──$LBLUE Plank dock theme "
    dir_check $HOME/.local/share/plank/themes
    cp plank/* $HOME/.local/share/plank/themes/ -r
fi


if [ -d sddm/$THEME ]; then
    print "$LIME├──$LBLUE SDDM login theme "
    if ! $(sudo -n true 2>/dev/null); then echo -ne "$LIME│ $LBLUE   Please provide "; fi
    [ ! -d /usr/share/sddm/themes/ ] && sudo mkdir -p /usr/share/sddm/themes
    sudo cp sddm/$THEME* /usr/share/sddm/themes/ -r
    sddm_config=true
fi

if [ -f albert/$THEME.qss ]; then
    print "$LIME├──$LBLUE Albert launcher theme "
    if ! $(sudo -n true 2>/dev/null); then echo -ne "$LIME│ $LBLUE   Please provide "; fi
    [ ! -d /usr/share/albert/widgetsboxmodel/themes/ ] && sudo mkdir -p /usr/share/albert/widgetsboxmodel/themes/
    sudo cp albert/$THEME.qss /usr/share/albert/widgetsboxmodel/themes/
fi

sleep 0.5
echo -e "$LIME│\n└─ Installation done."


sleep 1
echo ""
echo -ne "$LIME┌─$LBLUE Do You want to apply the theme? (y/n) "
read REPLY;
if [[ "$REPLY" =~ ^[y/Y]$ ]]; then   
    [ -f look-and-feel/$THEME/contents/layouts/plasma-org.kde.plasma.desktop-appletsrc ] && read -p "$LIME├──$LBLUE Apply panel layout? (y/n) " PANEL
    echo -ne "$LIME│ $LBLUE Applying theme"   
    sleep 0.4; echo -ne "."; sleep 0.4; echo -ne "."; sleep 0.4; echo -ne ".";
    # echo $THEME > $HOME/.config/kdedefaults/package
    # echo -e "[Theme]\nname=$THEME" > $HOME/.config/kdedefaults/plasmarc
    [[ "$PANEL" =~ ^[y/Y]$ ]] && cp look-and-feel/$THEME/contents/layouts/plasma-org.kde.plasma.desktop-appletsrc ~/.config/
    lookandfeeltool -a $THEME 2>/dev/null
    $wallpaper && plasma-apply-wallpaperimage $HOME/.local/share/wallpapers/$THEME/contents/images/$wallpaper_file_name 1>/dev/null
    $wallpaper && sed -i "s|Image=.*|Image=$HOME/.local/share/wallpapers/$THEME/|g" $HOME/.config/kscreenlockerrc
    $wallpaper && sed -i "s|PreviewImage=.*|PreviewImage=$HOME/.local/share/wallpapers/$THEME/|g" $HOME/.config/kscreenlockerrc
    $kvantum && echo -e "[General]\ntheme=$THEME" > $HOME/.config/Kvantum/kvantum.kvconfig
    sed -i "s|ColorScheme=.*|ColorScheme=$THEME|g" $HOME/.config/kdeglobals
    sed -i "s|LookAndFeelPackage=.*|LookAndFeelPackage=$THEME|g" $HOME/.config/kdeglobals
    sed -i "s|Theme=.*|Theme=$THEME|g" $HOME/.config/kdedefaults/ksplashrc
    sed -i "s|Theme=.*|Theme=$THEME|g" $HOME/.config/kdedefaults/kscreenlockerrc
    sed -i "s|theme=.*|theme=__aurorae__svg__$THEME|g" $HOME/.config/kdedefaults/kwinrc
    sed -i "s|singleModeLayoutName=.*|singleModeLayoutName=$THEME|g" $HOME/.config/lattedockrc
    sed -i "s|DefaultProfile=.*|DefaultProfile=$THEME.profile|g" $HOME/.config/konsolerc
    $sddm_config && sudo sed -i "s|Current=.*|Current=$THEME|g" /etc/sddm.conf.d/kde_settings.conf
    # Do you also prefer MediumRounded applet when switching apps? I do :)
    [ -d $HOME/.local/share/kwin/tabbox/MediumRounded ] && sed -i "s|LayoutName=.*|LayoutName=MediumRounded|g" $HOME/.config/kwinrc
    sleep 0.5; echo -e "$LIME Applied."
else
    echo -ne "$LIME│ $LBLUE Alright"; sleep 0.3; echo -ne ".. "; sleep 0.5; echo -ne "You don't get any candies "; sleep 1; echo -ne "😏"; sleep 2
    echo ""
fi
echo -e "$LIME└─ ^ Bye ^"
