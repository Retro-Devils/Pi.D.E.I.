#!/bin/bash

export NCURSES_NO_UTF8_ACS=1

###----------------------------###
### INSTALLER MENU FUNCTIONS   ###
###----------------------------###
function pidei-install-menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " Pi.D.E.I. VERSION 1.0 " \
            --ok-label Select --cancel-label Exit-Installer \
            --menu "Pi.D.E.I INSTALLER" 25 40 40 \
            1 "Install/Update Pi.D.E.I. " \
            2 "Pi.D.E.I Information   " \
            2>&1 > /dev/tty)

        case "$choice" in
            1) install-pidei  ;;
            2) pidei-info     ;;
	    +) none ;;
            *) break       ;;
        esac
    done
}

function install-pidei() {
if [ -d "$HOME//Pi.D.E.I.//" ]; then sudo rm -R "$HOME"/Pi.D.E.I./; fi
if [ -f "$HOME/RetroPie/retropiemenu/pidei.sh" ]; then sudo rm "$HOME"/RetroPie/retropiemenu/pidei.sh; fi
if [ -f "/usr/local/bin/pidei" ]; then sudo rm /usr/local/bin/pidei; fi
cd $HOME
git clone https://github.com/Retro-Devils/Pi.D.E.I.
sudo wget -O "/usr/local/bin/pidei" https://raw.githubusercontent.com/Retro-Devils/Pi.D.E.I./main/pidei.sh
cp "$HOME"/Pi.D.E.I./pidei.sh -f "$HOME"/RetroPie/retropiemenu/
cp "$HOME"/Pi.D.E.I./pi-dei-logo.png -f "$HOME"/RetroPie/retropiemenu/icons/
sudo chmod 755 /usr/local/bin/pidei
chmod 755 "$HOME"/RetroPie/retropiemenu/pidei.sh
chmod -R 755 $HOME//Pi.D.E.I./
sleep 2
if [ ! -s "$HOME/RetroPie/retropiemenu/gamelist.xml" ]; then sudo rm -f $HOME/RetroPie/retropiemenu/gamelist.xml; fi
if [ ! -f "$HOME/RetroPie/retropiemenu/gamelist.xml" ]; then cp /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml $HOME/RetroPie/retropiemenu/gamelist.xml; fi
CONTENT1="\t<game>\n\t\t<path>./pidei.sh</path>\n\t\t<name>Pi Dynamic Emu Installer</name>\n\t\t<desc>PI Dynamic Emu Installer is a tool to install offical and unoffical emus with ease. </desc>\n\t\t<image>./icons/pi-dei-logo.png</image>\n\t\t<releasedate>20220907T173842</releasedate>\n\t\t<developer>The Retro Devils</developer>\n\t\t<publisher>The Retro Devils</publisher>\n\t\t<genre>Pi-DEI Script</genre>\n\t</game>"
C1=$(echo $CONTENT1 | sed 's/\//\\\//g')
if grep -q pidei.sh "$HOME/RetroPie/retropiemenu/gamelist.xml"; then echo "gamelist.xml entry confirmed"
else
	sed "/<\/gameList>/ s/.*/${C1}\n&/" $HOME/RetroPie/retropiemenu/gamelist.xml > $HOME/temp
	cat $HOME/temp > $HOME/RetroPie/retropiemenu/gamelist.xml
	rm -f $HOME/temp
fi
sleep 1
echo "THANKS FOR INSTALLING ENJOY!!"
sleep 5
}

function pidei-info() {
dialog  --sleep 1 --title "PI.D.E.I INFO" --msgbox " 
<-------------WELCOME--------------->
WHATS THIS DO?
- EASY INSTALL EMUS FOR RETROPIE
- FORCE UPDATE RETROPIE SETUP
- INSTALL MULTI CORES AT OUNCE" 0 0
}

pidei-install-menu
