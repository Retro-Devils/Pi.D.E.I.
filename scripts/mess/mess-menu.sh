#!/bin/bash
function mess-menu() {
if [ -f $HOME/pidei/scripts/mess-confirm.sh ]; then
dialog  --sleep 1 --title "MESS/MAME INSTALLED" --msgbox "
MESS & MAME ARE ALREADY INSTALLED !!" 0 0
else
    local choice
    while true; do
        choice=$(dialog --backtitle "DEVILS MESS INSTALLER" --title "1.1" \
            --ok-label OK --cancel-label Back \
            --menu "ARE MAME, LR-MESS & LR-MAME INSTALLED" 25 75 20 \
	    1 "<-->YES THEY ARE INSTALLED<-->" \
            2 "<-->NO THEY ARE NOT/UNSURE<-->" \
            2>&1 > /dev/tty)
        case "$choice" in
	    1) installed ;;
            2) not-installed ;;
            *)  break ;;
        esac
    done
fi
}

function installed() {
dialog  --sleep 1 --title "WARNING" --msgbox "
PI DEI WILL NOW THINK MESS IS INSTALLED " 0 0
wget https://raw.githubusercontent.com/Retro-Devils/Pi.D.E.I./main/scripts/mess/mess-confirm.sh -P $HOME/pidei/scripts/
}

function not-installed() {
cd $HOME/RetroPie-Setup
sudo ./retropie_packages.sh lr-mess
sleep 2
sudo ./retropie_packages.sh lr-mame
sleep 2
sudo ./retropie_packages.sh mame
sleep 2
cd
sleep 1
wget https://raw.githubusercontent.com/Retro-Devils/Pi.D.E.I./main/scripts/mess-mess-confirm.sh -P $HOME/pidei/scripts/
sudo cp /opt/retropie/libretrocores/lr-mess/mamemess_libretro.so -P /opt/retropie/libretrocores/lr-mess/mess_libretro.so
wget https://raw.githubusercontent.com/Retro-Devils/Pi.D.E.I./main/scripts/mess/run-mes.sh -P $HOME/RetroPie-Setup/scriptmodules/
}

mess-menu
