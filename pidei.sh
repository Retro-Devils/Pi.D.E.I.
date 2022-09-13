#-----------INTRO VIDEO-----------#
clear
omxplayer "$HOME"/Pi-DEI/intro.mp4  > /dev/null 2>&1

function emu-menu() {
dialog  --sleep 1 --title EASY EMU INSTALELR INFO" --msgbox " 
<-------------WELCOME--------------->
WHATS THIS DO?
- EASY INSTALL EMUS FOR RETROPIE
- FORCE UPDATE RETROPIE SETUP
<------------->FYI<------------->
RA MEANS RETROARCH CORE
SA MEANS STANDALONE EMU" 0 0
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
      17 "Dreamcast                       12.6GB       19 GAMES" \
      18 "Electron                         2.5MB      152 GAMES" \
      19 "Famicon                           19MB      169 GAMES" \
      20 "Famicom Disk                       2MB       43 GAMES" \
      21 "Game and Watch                    48MB       53 GAMES" \
      22 "Gameboy                           42MB      565 GAMES" \
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
      61 "Wonderswan Color                 116MB       84 GAMES" \
      62 "Sharp X1                         7.6MB       69 GAMES" \
      63 "Sharp X68000                     504MB      418 GAMES" \
      64 "ZMachine                           4MB       30 GAMES" \
      65 "ZXSpectrum                        38MB     1111 GAMES" \
	  66 "FORCE RETROPIE SETUP SCRIPT UPDATE                   " \
      2>&1 >/dev/tty)

    case "$choice" in
    1) install-emu "amiga" "lr-puae" ;;
    2) install-emu "amigacd32" "lr-puae" ;;
    3) install-emu "amstradcpc" "lr-caprice32" ;;
    4) install-emu "arcade" "lr-mame2003" ;;
    5) install-emu "arcadia" ;;
    6) install-emu "astrocade" ;;
    7) install-emu "atari800" ;;
    8) install-emu "atari2600" "lr-stella" ;;
    9) install-emu "atari5200" "lr-atari800";;
    10) install-emu "atari7800" "lr-prosystem";;
    11) install-emu "atarilynx" "lr-beetle-lynx" ;;
    12) install-emu "atarist" "lr-hatari" ;;
    13) install-emu "atomiswave" ;;
    14) install-emu "c64" ;;
    15) install-emu "coleco" "lr-bluemsx" ;;
    16) install-emu "dragon32" "xroar" ;;
    17) install-emu "dreamcast" "redream" ;;
    18) install-emu "electron" ;;
    19) install-emu "famicon" ;;
    20) install-emu "fds" ;;
    21) install-emu "gameandwatch" ;;
    22) install-emu "gb" ;;
    23) install-emu "gba" "lr-mgba" ;;
    24) install-emu "gbc" ;;
    25) install-emu "gamegear" "lr-genesis-plus-gx" ;;
    26) install-emu "intellivision" "lr-freeintv" ;;
    27) install-emu "lightgun" ;;
    28) install-emu "markiii" ;;
    29) install-emu "mastersystem" ;;
    30) install-emu "megadrive" "lr-genesis-plus-gx" ;;
    31) megadrive-japan ;;
    32) install-emu "msx" ;;
    33) install-emu "msx2" ;;
    34) install-emu "n64" ;;
    35) install-emu "naomi" ;;
    36) install-emu "nds" ;;
    37) install-emu "neogeo" ;;
    38) install-emu "ngpc" ;;
    39) install-emu "nes" ;;
    40) install-emu "openbor" ;;
    41) install-emu "oric" ;;
    42) install-emu "pokemini" ;;
    43) install-emu "psx" "lr-pcsx_rearmed" ;;
    44) psp-pack ;;
    45) model-3 ;;
    46) install-emu "saturn" "lr-yabause" ;;
    47) saturn-japan "saturn-japan" ;;
    48) install-emu "scummvm" ;;
    49) install-emu "sega32x" ;;
    50) install-emu "segacd" "lr-picodrive" ;;
    51) install-emu "sfc" ;;
    52) install-emu "sg-1000" "lr-genesis-plus-gx" ;;
    53) install-emu "snes" "lr-snes9x" ;;
    54) msu1-pack ;;
    55) install-emu "supergrafx" "lr-beetle" ;;
    56) tg16-fix ;;
    57) install-emu "vectrex" "lr-vecx" ;;
    58) install-emu "videopac" ;;
    59) install-emu "virtualboy" ;;
    60) install-emu "svmu" ;;
    61) install-emu "wonderswancolor" ;;
    62) install-emu "x1" ;;
    63) install-emu "x68000" ;;
    64) install-emu "zmachine" ;;
    65) install-emu "zxspectrum" ;;
	66) 
     +) none  ;;
     *) break ;;
    esac
   done
fi
}
function install-emu() {
cd $HOME/RetroPie-Setup
sudo ./retropie_packages.sh "$2"
}

function multi-cores() {
          whiptail --clear --title ""$1" Multi Core Menu" --separate-output --checklist "Choose Core(s) and click Download:" 0 0 0 \
      --ok-button Download --cancel-button Back \
                "1" ""$2" Core" off \
                "2" ""$3" Core" off \
                "3" ""$4" Core" off \
                "4" ""$5" Core" off \
                2>/tmp/results
    while read -r choice  
        do
        case $choice in

            1) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$2" ;;
            2) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$3" ;;
            3) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$4" ;;
            4) cd $HOME/RetroPie-Setup && sudo ./retropie_packages.sh "$5" ;;
            *) ;;
        esac
        done < /tmp/results
}

emu-menu
