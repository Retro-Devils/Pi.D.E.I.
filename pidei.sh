#-----------INTRO VIDEO-----------#
clear
omxplayer "$HOME"/pidei/intro.mp4  > /dev/null 2>&1

function emu-menu() {
dialog  --sleep 1 --title PI.D.E.I INFO" --msgbox " 
<-------------WELCOME--------------->
WHATS THIS DO?
- EASY INSTALL EMUS FOR RETROPIE
- FORCE UPDATE RETROPIE SETUP
<------------->FYI<------------->
- RA MEANS RETROARCH CORE
- SA MEANS STANDALONE EMU
- MULTI CORES/EMUS LOADS A MENU" 0 0
  local choice

 while true; do
    choice=$(dialog --backtitle "$BACKTITLE" --title "EASY EMU INSTALLER" \
      --ok-label Install --cancel-label Back \
      --menu "PRESS A/ENTER TO INSTALL EMU" 30 70 50 \
      + "<->CONSOLE NAME<---------------->CORE/EMU<" \
      1 "Amiga<------------------------->RA PUAE" \
      2 "AmigaCD32<--------------------->RA PUAE" \
      3 "Amstrad CPC<------------------->RA CAPRICE32" \
      4 "Arcade<------------------------>RA MAME2003" \
      5 "Arcadia<------------------------>" \
      6 "Astrocade<------------------------>" \
      7 "Atari800<------------------------>" \
      8 "Atari2600<------------------------>" \
      9 "Atari5200<------------------------>" \
      10 "Atari7800<------------------------>" \
      11 "AtariLynx<------------------------>" \
      12 "AtariST<------------------------>" \
      13 "Atomiswave<------------------------>" \
      14 "Commadore64<------------------------>" \
      15 "Colecovision<------------------------>" \
      16 "Dragon32<------------------------>" \
      17 "Dreamcast<------------------------>" \
      18 "Electron<------------------------>" \
      19 "Famicon<------------------------>" \
      20 "Famicom Disk<------------------------>" \
      21 "Game and Watch<------------------------>" \
      22 "Gameboy<------------------------>MULTI CORES" \
      23 "Gameboy Advance                  3.4GB     1006 GAMES" \
      24 "Gameboy Color                    232MB      538 GAMES" \
      25 "Gamegear                          42MB      249 GAMES" \
      26 "Intellivision                      1MB       62 GAMES" \
      27 "****Lightgun MAME****             ??GB       ?? GAMES" \
      28 "MarkIII                            6MB       58 GAMES" \
      29 "Mastersystem                      35MB      280 GAMES" \
      30 "Genesis/Megadrive                409MB      561 GAMES" \
      31 "Genesis/Megadrive-Japan          149MB      278 GAMES" \
      32 "MSX                               30MB      708 GAMES" \
      33 "MSX 2                           6.24MB       83 GAMES" \
      34 "Nintendo 64                      5.0GB      338 GAMES" \
      35 "Naomi                            1.5GB       15 GAMES" \
      36 "Nintendo DS                        4GB      171 GAMES" \
      37 "NeoGeo                           2.3GB      142 GAMES" \
      38 "Neo Geo Pocket Color              21MB       40 GAMES" \
      39 "Nintendo Entertainment System    100MB      869 GAMES" \
      40 "Openbor                         1.84GB       37 GAMES" \
      41 "Oric                             5.4MB      136 GAMES" \
      42 "Pokemini                         5.4MB       44 GAMES" \
      43 "PlayStation 1                      3GB       29 GAMES" \
      44 "PSP                              ???GB      600 GAMES" \
      45 "Sega Model 3.                     ??GB       15 GAMES" \
      46 "Sega Saturn" \
      47 "Sega Saturn Japan" \
      48 "ScummVM                          2.5GB       21 GAMES" \
      49 "Sega32x                           63MB       37 GAMES" \
      50 "SegaCD                            11GB       52 GAMES" \
      51 "Super Famicon                    475MB      487 GAMES" \
      52 "SG-1000                            1MB       68 GAMES" \
      53 "SNES                             508MB      603 GAMES" \
      54 "SNES MSU1                         ??MB       ?? GAMES" \
      55 "SuperGraffiix                    2.4MB        5 GAMES" \
      56 "Turbo Graffix 16/PC Engine        20MB       94 GAMES" \
      57 "Vectrex                          201KB       20 GAMES" \
      58 "VideoPAC                         430KB       99 GAMES" \
      59 "Virtual Boy                        8MB       24 GAMES" \
      60 "Dreamcast VMU                      3MB      115 GAMES" \
      61 "Wine" \
      62 "Wonderswan Color                 116MB       84 GAMES" \
      63 "Sharp X1                         7.6MB       69 GAMES" \
      64 "Sharp X68000                     504MB      418 GAMES" \
      65 "ZMachine                           4MB       30 GAMES" \
      66 "ZXSpectrum                        38MB     1111 GAMES" \
       + "<----------------Pi.D.E.I Tools--------------------->" \
      T1 "FORCE RETROPIE SETUP SCRIPT UPDATE                   " \
      T2 "UPDATE PI.D.E.I                                      " \
      2>&1 >/dev/tty)

    case "$choice" in
    1) install-emu "Amiga" "lr-puae" ;;
    2) install-emu "Amigacd32" "lr-puae" ;;
    3) install-emu "Amstradcpc" "lr-caprice32" ;;
    4) multi-cores "Arcade" "lr-mame2003" ;;
    5) install-emu "Arcadia" ;;
    6) install-emu "Astrocade" ;;
    7) install-emu "Atari800" ;;
    8) install-emu "Atari2600" "lr-stella" ;;
    9) install-emu "Atari5200" "lr-atari800";;
    10) install-emu "Atari7800" "lr-prosystem";;
    11) install-emu "Atarilynx" "lr-beetle-lynx" ;;
    12) install-emu "Atarist" "lr-hatari" ;;
    13) install-emu "Atomiswave" ;;
    14) install-emu "C64" ;;
    15) install-emu "Coleco" "lr-bluemsx" ;;
    16) install-emu "Dragon32" "xroar" ;;
    17) install-emu "Dreamcast" "redream" ;;
    18) install-emu "Electron" ;;
    19) install-emu "Famicon" ;;
    20) install-emu "FDS" ;;
    21) install-emu "Game&Watch" ;;
    22) multi-cores "GameBoy" "lr-mgba" "lr-gb" ;;
    23) install-emu "GameBoy Advacnce" "lr-mgba" ;;
    24) install-emu "GameBoy Color" ;;
    25) install-emu "Game Gear" "lr-genesis-plus-gx" ;;
    26) install-emu "Intellivision" "lr-freeintv" ;;
    27) install-emu "Lightgun" ;;
    28) install-emu "Markiii" ;;
    29) install-emu "Mastersystem" ;;
    30) install-emu "Megadrive" "lr-genesis-plus-gx" ;;
    31) install-emu "SNES" "lr-snes9x" ;;
    32) install-emu "MSX" ;;
    33) install-emu "MSX2" ;;
    34) install-emu "N64" ;;
    35) install-emu "Naomi" ;;
    36) install-emu "NDS" ;;
    37) install-emu "NeoGeo" ;;
    38) install-emu "NeoGeo Pocket Color" ;;
    39) install-emu "NES" ;;
    40) install-emu "Openbor" ;;
    41) install-emu "Oric" ;;
    42) install-emu "Pokemini" ;;
    43) install-emu "PS1" "lr-pcsx_rearmed" ;;
    44) install-emu "PSP" "" ;;
    45) install-emu "Sega Model-3" "lr-snes9x" ;;
    46) install-emu "Sega Saturn" "lr-yabause" ;;
    47) install-emu "Sega Saturn Japan" "lr-snes9x" ;;
    48) install-emu "ScummVM" ;;
    49) install-emu "Sega32x" ;;
    50) install-emu "SegaCD" "lr-picodrive" ;;
    51) install-emu "SFC" ;;
    52) install-emu "SG-1000" "lr-genesis-plus-gx" ;;
    53) install-emu "SNES" "lr-snes9x" ;;
    54) install-emu "SNES-MSU1" "lr-snes9x" ;;
    55) install-emu "SuperGrafx" "lr-beetle" ;;
    56) install-emu "TurboGrafx-16" "lr-snes9x" ;;
    57) install-emu "Vectrex" "lr-vecx" ;;
    58) install-emu "Videopac" ;;
    59) install-emu "Virtualboy" ;;
    60) install-emu "SVmu" ;;
    61) install-wine ;;
    62) install-emu "Wonderswancolor" ;;
    63) install-emu "X1" ;;
    64) install-emu "X68000" ;;
    65) install-emu "Zmachine" ;;
    66) install-emu "ZXspectrum" ;; 
     +) none  ;;
    T1) update-setup-script ;;
    T2) update-pidei ;;
     *) break ;;
    esac
   done
fi
}

##-----------------------------Example-----------------------------##
##System-Name<------------------------>Core-Name
##System-Name<------------------------>Mulit-Emus/Cores
##install-emu "system-name" "lr-core1" "lr-core2" "lr-core3" "standalone emu1" "standalone emu2"
##-----------------------------------------------------------------##

function install-emu() {
cd $HOME/RetroPie-Setup
sudo ./retropie_packages.sh "$2"
}

function multi-cores() {
          whiptail --clear --title ""$1" Multi Core Menu" --separate-output --checklist "Choose Core(s) and click Download:" 0 0 0 \
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
            1) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$2" ;;
            2) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$3" ;;
            4) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$4" ;;
	    +) none ;;
            *) ;;
        esac
        done < /tmp/results
}

function wine() {
dialog  --sleep 1 --title WINE EMU INFO" --msgbox " 
<-------------WELCOME--------------->
PI.D.E.I WILL NOW INSTALL WINE/BOX86
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

emu-menu
