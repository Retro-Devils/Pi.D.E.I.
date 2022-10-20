#!/bin/bash
export NCURSES_NO_UTF8_ACS=1


rpi=$(cat /proc/device-tree/model |awk '{print $3}')

if [ "$rpi" = "Zero" ]; then bash $HOME/Pi.D.E.I./scripts/pidei-0.sh
elif [ "$rpi" = "1" ]; then bash $HOME/Pi.D.E.I./scripts/pidei-0.sh
elif [ "$rpi" = "2" ]; then bash $HOME/Pi.D.E.I./scripts/pidei-2.sh
elif [ "$rpi" = "3" ]; then bash $HOME/Pi.D.E.I./scripts/pidei-2.sh
elif [ "$rpi" = "4" ]; then bash $HOME/Pi.D.E.I./scripts/pidei-4.sh
else
{$HOME}/Pi.D.E.I./scripts/pidei-other.sh
fi
