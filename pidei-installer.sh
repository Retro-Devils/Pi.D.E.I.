#!/bin/bash

export NCURSES_NO_UTF8_ACS=1

local rst="$(tput sgr0)"
local fgblk="${rst}$(tput setaf 0)" # Black - Regular
local fgred="${rst}$(tput setaf 1)" # Red
local fggrn="${rst}$(tput setaf 2)" # Green
local fgylw="${rst}$(tput setaf 3)" # Yellow
local fgblu="${rst}$(tput setaf 4)" # Blue
local fgpur="${rst}$(tput setaf 5)" # Purple
local fgcyn="${rst}$(tput setaf 6)" # Cyan
local fgwht="${rst}$(tput setaf 7)" # White

    local bld="$(tput bold)"
    local bfgblk="${bld}$(tput setaf 0)"
    local bfgred="${bld}$(tput setaf 1)"
    local bfggrn="${bld}$(tput setaf 2)"
    local bfgylw="${bld}$(tput setaf 3)"
    local bfgblu="${bld}$(tput setaf 4)"
    local bfgpur="${bld}$(tput setaf 5)"
    local bfgcyn="${bld}$(tput setaf 6)"
    local bfgwht="${bld}$(tput setaf 7)"
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
	    + "''${fgred}'          .    .      '
''${fgred}'          |\   |\     '
''${fgred}'       _..;|;__;|;    '
''${fgred}'     ,`   `;` \`;`-.  '
''${fgred}'     7;-..     :    ) '
''${fgred}'.--._)|   `;==,|,==`  '
''${fgred}' `\`@; \_ `<`'${bfgylw}'G'${fgred}',\"\ '${bfgylw}'G'${fgred}').'
''${fgred}'   `\/-;,(  )  .>. )  '
''${fgred}'       < ,-;`-.__.;`  '
''${fgred}'        `\_ `-,__,`   '
''${fgred}'           `-..,;,>   '" \
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
if [ -d "$HOME/pidei/" ]; then sudo rm -R "$HOME"/pidei/; fi
if [ -f "$HOME/RetroPie/retropiemenu/pidei.sh" ]; then sudo rm "$HOME"/RetroPie/retropiemenu/pidei.sh; fi
if [ -f "/usr/local/bin/pidei" ]; then sudo rm /usr/local/bin/pidei; fi
wget https://github.com/Retro-Devils/Pi.D.E.I./raw/main/intro.mp4 -P "$HOME"/pidei/
wget https://raw.githubusercontent.com/Retro-Devils/Pi.D.E.I./main/pidei.sh -P "$HOME"/pidei/
wget https://github.com/Retro-Devils/Pi.D.E.I./raw/main/pi-dei-logo.png -P "$HOME"/pidei/
wget https://raw.githubusercontent.com/Retro-Devils/Pi.D.E.I./main/scripts/mess/mess-menu.sh -P $HOME/pidei/scripts/
sudo wget -O "/usr/local/bin/pidei" https://raw.githubusercontent.com/Retro-Devils/Pi.D.E.I./main/pidei.sh
cp "$HOME"/pidei/pidei.sh -f "$HOME"/RetroPie/retropiemenu/
cp "$HOME"/pidei/pi-dei-logo.png -f "$HOME"/RetroPie/retropiemenu/icons/
sudo chmod 755 /usr/local/bin/pidei
chmod 755 "$HOME"/RetroPie/retropiemenu/pidei.sh
chmod -R 755 $HOME/pidei
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
