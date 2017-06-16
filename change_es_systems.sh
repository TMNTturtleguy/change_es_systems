#!/bin/bash
# change_es_systems.sh
#############
# This script lets you change the es_systems.cfg file used to display systems using your controllers.
#
#
# TMNTturtlguy - June 2017

# dialog functions ##########################################################

function dialogMenu() {
    local text="$1"
    shift
    dialog --no-mouse \
        --backtitle "$BACKTITLE" \
        --cancel-label "Back" \
        --ok-label "OK" \
        --menu "$text\n\nChoose an option." 17 75 10 "$@" \
        2>&1 > /dev/tty
}

function dialogYesNo() {
    dialog --no-mouse --backtitle "$BACKTITLE" --yesno "$@" 15 75 2>&1 > /dev/tty
}

function dialogMsg() {
    dialog --no-mouse --ok-label "OK" --backtitle "$BACKTITLE" --msgbox "$@" 20 70 2>&1 > /dev/tty
}

function dialogInfo {
    dialog --infobox "$@" 8 50 2>&1 >/dev/tty
}

# end of dialog functions ###################################################


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
}

function change_to_consoles() {
    rm /opt/retropie/configs/all/emulationstation/es_systems.cfg
	
	cp /opt/retropie/configs/all/emulationstation/es_systems/consoles/es_systems.cfg /opt/retropie/configs/all/emulationstation/
}

function change_to_customs() {
    rm /opt/retropie/configs/all/emulationstation/es_systems.cfg
	
	cp /opt/retropie/configs/all/emulationstation/es_systems/customs/es_systems.cfg /opt/retropie/configs/all/emulationstation/
}

function change_to_favorites() {
    rm /opt/retropie/configs/all/emulationstation/es_systems.cfg
	
	cp /opt/retropie/configs/all/emulationstation/es_systems/favorites/es_systems.cfg /opt/retropie/configs/all/emulationstation/
}


# START HERE #################################################################

main_menu
