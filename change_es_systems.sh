#!/bin/bash
# change_es_systems.sh
#############
# This script lets you change the es_systems.cfg file used to display systems using your controllers.
#
# v1
# TMNTturtlguy - June 2017
#
# place script in /home/pi/RetroPie/retropiemenu/
# In order to run the script you must create the following folders:
#    /opt/retropie/configs/all/emulationstation/es_systems
# Then within that folder create these 4 folders:
#    all
#    consoles
#    customs
#    favorites
# Example of the full path: /opt/retropie/configs/all/emulationstation/es_systems/favorites
# Within each folder you have created place a es_systems.cfg file. The file needs to be named the same in each folder, but the systems can be different.
# Restart EmulationStation and the script is located in the retropie menu
#
# v2
# EmulationStation Restart Script by cyperghost - June 2017
#    Special thanks to cyperghost for helping find a great solution to restart ES from command line or script See forum post https://retropie.org.uk/forum/topic/11050/restart-es-via-bash-script
#
# 

#script welcome screen
dialog --backtitle "W A R N I N G !" --title " WARNING! " \
    --yesno "\nThis script lets you change your es_systems.cfg file used to display systems.  This will not change or remove any systems or content, it will change which systems are displayed based on user created es_systems.cfg files. ES will automatically restart.\n\n\nDo you want to proceed?" \
    15 75 2>&1 > /dev/tty \
    || exit


function restart_es() {
    touch /tmp/es-restart \
    && pkill -f "/opt/retropie/supplementary/.*/emulationstation([^.]|$)"
}

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "What do you want to do?" 17 75 10 \
            B "Change to es_systems ALL" \
            E "change to es_systems Consoles" \
            C "Change to es_systems Customs" \
            R "Change to es_systems Favorites" \
            2>&1 > /dev/tty)

        case "$choice" in
            B)  change_to_all ;;
            E)  change_to_consoles ;;
            C)  change_to_customs ;;
            R)  change_to_favorites ;;
            *)  break ;;
        esac
    done
}


function change_to_all() {
    rm /opt/retropie/configs/all/emulationstation/es_systems.cfg
    cp /opt/retropie/configs/all/emulationstation/es_systems/all/es_systems.cfg /opt/retropie/configs/all/emulationstation/
    restart_es
}

function change_to_consoles() {
    rm /opt/retropie/configs/all/emulationstation/es_systems.cfg
    cp /opt/retropie/configs/all/emulationstation/es_systems/consoles/es_systems.cfg /opt/retropie/configs/all/emulationstation/
    restart_es
}

function change_to_customs() {
    rm /opt/retropie/configs/all/emulationstation/es_systems.cfg
    cp /opt/retropie/configs/all/emulationstation/es_systems/customs/es_systems.cfg /opt/retropie/configs/all/emulationstation/
    restart_es
}

function change_to_favorites() {
    rm /opt/retropie/configs/all/emulationstation/es_systems.cfg
    cp /opt/retropie/configs/all/emulationstation/es_systems/favorites/es_systems.cfg /opt/retropie/configs/all/emulationstation/
    restart_es
}


main_menu
