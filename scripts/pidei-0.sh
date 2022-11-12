#!/bin/bash
export NCURSES_NO_UTF8_ACS=1
BACKTITLE="<-----Pi.D.E.I-----Pi Dynamic Emu Installer----->"

#-----------INTRO VIDEO-----------#
clear
omxplayer "$HOME"/pidei/intro.mp4  > /dev/null 2>&1

function emu-menu() {
  local choice
  while true; do
    choice=$(dialog --backtitle "$BACKTITLE" --title "PI DYNAMIC EMU INSTALLER" \
      --ok-label Install --cancel-label Exit \
      --menu "PRESS A/ENTER TO INSTALL EMU" 40 60 40 \
      + "<                                         >" \
      + "<-->CONSOLE NAME<------------->CORE/EMU<-->" \
      + "<                                         >" \
      1 "Astrocade<-------------------->" \
      2 "Atari800<--------------------->RA ATARI800"\
      3 "Atari2600<-------------------->RA STELLA" \
      4 "Electron<-------------------->" \
      5 "Famicon<--------------------->" \
      6 "Famicom Disk<---------------->" \
      7 "Game and Watch<-------------->" \
      8 "Gameboy<--------------------->MULTI CORES/EMUS" \
      9 "Gameboy Advance<------------->MULTI CORES/EMUS" \
      10 "Gameboy Color<--------------->MULTI CORES/EMUS" \
      11 "Gamegear<-------------------->MULTI CORES/EMUS" \
      12 "Genesis/Megadrive<----------->" \
      13 "NES<------------------------->" \
      14 "Pokemini<-------------------->" \
      15 "Sega32x<---------------------->CORE/EMU" \
      16 "SegaCD<----------------------->CORE/EMU" \
      17 "Super Famicon<---------------->CORE/EMU" \
      18 "SG-1000<---------------------->CORE/EMU" \
      19 "SNES<------------------------->CORE/EMU" \
      20 "SNES MSU1<-------------------->CORES/EMU" \
       + "<                                     >" \
       + "<-----------Pi.D.E.I Tools------------>" \
       + "<                                     >" \
      T1 "FORCE RETROPIE SETUP SCRIPT UPDATE     " \
      T2 "PI.D.E.I UPDATER                       " \
      T3 "PI.D.E.I INFORMATION                   " \
      T4 "PI.D.E.I CREDITS                       " \
       - "  _____   _     ___     _____   ______  " \
       - " |  __ | |_|   |    \  |  ___| |_    _| " \
       - " |  ___|  _    |  |  \ | |__     |  |   " \
       - " | |     | |   |  |  | |  __|    |  |   " \
       - " | |     | |   |  |  / | |___   _|  |_  " \
       - " |_|     |_|   |___/   |_____| |______| " \
      2>&1 >/dev/tty)

    case "$choice" in
    1) install-emu "Astrocade" ;;
    2) install-emu "Atari800" ;;
    3) install-emu "Atari2600" "lr-stella" ;;
    4) install-emu "Electron" ;;
    5) install-emu "Famicon" ;;
    6) install-emu "FDS" ;;
    7) install-emu "Game&Watch" "lr-gw" ;;
    8) multi-cores "GameBoy" "lr-mgba" "lr-gb" ;;
    9) multi-cores "GameBoy Advacnce" "lr-mgba" "NO" "NO";;
    10) install-emu "GameBoy Color" "lr-tgbdual" ;;
    11) install-emu "Game Gear" "lr-genesis-plus-gx" "NO" "NO" ;;
    12) install-emu "Megadrive" "lr-genesis-plus-gx" ;;
    13) multi-cores "NES" "lr-quicknes" ;;
    14) install-emu "Pokemini" "pokemini" ;;
    15) install-emu "Sega32x" ;;
    16) install-emu "SegaCD" "lr-picodrive" ;;
    17) install-emu "SFC" ;;
    18) install-emu "SG-1000" "lr-genesis-plus-gx" ;;
    19) multi-cores2 "SNES" "lr-snes9x" "lr-bsnes" "lr-snes9x2002" ;;
    20) install-emu "SNES-MSU1" "lr-snes9x" ;;
    T1) update-setup-script ;;
    T2) update-pidei ;;
    T3) pidei-info ;;
    T4) pidei-credits ;;
    -) no ;;
     *) break ;;
    esac
   done
}

##-----------------------------Offical Cores & Emus-----------------------------##

function install-emu() {
cd $HOME/RetroPie-Setup
sudo ./retropie_packages.sh "$2" install_bin
}

function multi-cores() {
          whiptail --clear --title "$1 Multi Core Menu" --separate-output --checklist "Choose Core(s) and click Download:" 0 0 0 \
      --ok-button Install --cancel-button Back \
                "+" "<--->RetroArch Cores<--->" off \
                "1" ""$2" Retroarch Core" off \
                "2" ""$3" Retroarch Core" off \
		"+" "<--->Standalone Emus<--->" off \
                "3" ""$4" Standalone Emu" off \
                2>/tmp/results
    while read -r choice
        do
        case $choice in
            1) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$2" install_bin ;;
            2) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$3" install_bin ;;
            3) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$4" install_bin ;;
	    +) none ;;
            *) ;;
        esac
        done < /tmp/results
}

function multi-cores2() {
          whiptail --clear --title "$1 Multi Core Menu" --separate-output --checklist "Choose Core(s) and click Download:" 0 0 0 \
      --ok-button Install --cancel-button Back \
                "+" "<--->RetroArch Cores<--->" off \
                "1" ""$2" Retroarch Core" off \
                "2" ""$3" Retroarch Core" off \
                "3" ""$4" Retroarch Core" off \
	        "+" "<--->Standalone Emus<--->" off \
                "4" ""$5" Standalone Emu" off \
                2>/tmp/results
    while read -r choice
        do
        case $choice in
            1) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$2" install_bin ;;
            2) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$3" install_bin ;;
            3) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$4" install_bin ;;
            4) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$5" install_bin ;;
	    +) none ;;
            *) ;;
        esac
        done < /tmp/results
}

function multi-cores3() {
          whiptail --clear --title "$1 Multi Core Menu" --separate-output --checklist "Choose Core(s) and click Download:" 0 0 0 \
      --ok-button Install --cancel-button Back \
                "+" "<--->RetroArch Cores<--->" off \
                "1" ""$2" Retroarch Core" off \
                "2" ""$3" Retroarch Core" off \
                "3" ""$4" Retroarch Core" off \
                "4" ""$5" Retroarch Core" off \
	        "+" "<--->Standalone Emus<--->" off \
                "5" ""$6" Standalone Emu" off \
                "6" ""$7" Standalone Emu" off \
                 2>/tmp/results
    while read -r choice
        do
        case $choice in
            1) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$2" install_bin ;;
            2) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$3" install_bin ;;
            3) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$4" install_bin ;;
            4) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$5" install_bin ;;
            5) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$6" install_bin ;;
            6) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$7" install_bin ;;
	    +) none ;;
            *) ;;
        esac
        done < /tmp/results
}

function mess-system() {
if [ -f "$HOME"/pidei/mess-confirm.sh ]; then
wget -m -r -np -nH -nd -R "index.html" https://raw.githubusercontent.com/Retro-Devils/Devils-Extra/main/scriptmodules/libretrocores/lr-mess-"${1}".sh -P "$HOME"/RetroPie-Setup/scriptmodules/libretrocores/ -erobots=off
sleep 2 
cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh lr-mess-"$1"
else
bash $HOME/pidei/scripts/mess-menu.sh
fi
}


##-----------------------------UnOffical Emus/Cores-----------------------------##

function install-wine() {
dialog  --sleep 1 --title "WINE EMU INFO" --msgbox "
<-------------WELCOME--------------->
PI.D.E.I. WILL NOW INSTALL WINE/BOX86
<-------------CREDITS--------------->
- SUPREME TEAM
- RETRO DEVILS
- GEORGE MCMULLEN
- BOX86/PITSEB
<------------->FYI<------------->
- WINE PLAYS OLD WINDOWS GAMES
- SYSTEM WILL REBOOT WHEN COMPLETE
- PUT ROMS IN HOME/PI/RETROPIE/ROMS/WINE" 0 0
curl -sSL https://bit.ly/3P2HiW8 | bash
}

function install-model-3() {
https://raw.githubusercontent.com/Retro-Devils/Sega-Model-3-PI-4/main/SM3-INSTALLER.sh
}


###-----------------------------PI.D.E.I TOOLS-----------------------------###

function update-setup-script() {
dialog  --sleep 1 --title "UPDATE RPI SETUP" --msgbox "
<------------------ATTENTION------------------->
Pi D.E.I WILL NOW FORCE UPDATE RETROPIE SETUP
IF YOU WANT TO CANCEL PLEASE PRES CONTROL+C NOW
<---------------------------------------------->" 0 0
cd /home/pi/RetroPie-Setup
git checkout .; git reset --hard HEAD; git pull
}

function update-pidei() {
if [ -d "$HOME/pidei/" ]; then sudo rm -R "$HOME"/pidei/; fi
if [ -f "$HOME/RetroPie/retropiemenu/pidei.sh" ]; then sudo rm "$HOME"/RetroPie/retropiemenupidei.sh; fi
if [ -f "/usr/local/bin/pidei" ]; then sudo rm /usr/local/bin/pidei; fi
wget https://github.com/Retro-Devils/Pi.D.E.I./raw/main/intro.mp4 -P "$HOME"/pidei/
wget https://raw.githubusercontent.com/Retro-Devils/Pi.D.E.I./main/pidei.sh -P "$HOME"/pidei/
wget https://github.com/Retro-Devils/Pi.D.E.I./raw/main/pi-dei-logo.png -P "$HOME"/pidei/
sudo wget -O "/usr/local/bin/pidei" https://raw.githubusercontent.com/Retro-Devils/Pi.D.E.I./main/pidei.sh
wget https://raw.githubusercontent.com/ALLRiPPED/Pi.D.E.I./main/scripts/mess/mess-menu.sh -P "$HOME"/pidei/scripts/
cp "$HOME"/pidei/pidei.sh -f "$HOME"/RetroPie/retropiemenu/
cp "$HOME"/pidei/pi-dei-logo.png -f "$HOME"/RetroPie/retropiemenu/icons/
sudo chmod 755 /usr/local/bin/pidei
chmod 755 "$HOME"/RetroPie/retropiemenu/pidei.sh
chmod 755 -R "$HOME"/pidei/
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
bash "$HOME/RetroPie/retropiemenu/pidei.sh"
exit 1
}


function pidei-info() {
dialog  --sleep 1 --title "PI.D.E.I INFO" --msgbox "
<-------------WELCOME--------------->
WHATS THIS DO?
- EASY INSTALL EMUS FOR RETROPIE
- FORCE UPDATE RETROPIE SETUP
<------------->FYI<------------->
- RA MEANS RETROARCH CORE
- MULTI CORES/EMUS LOADS A MENU" 0 0
}

function pidei-credits() {
dialog  --sleep 1 --title "PI.D.E.I CREDITS" --msgbox "
<-------------CREDITS--------------->
- ALL THE DEVILS
- RETROPIE OFFICAL
- CREDITS FOR EACH EMU WITH EMU INFO" 0 0
}

emu-menu
