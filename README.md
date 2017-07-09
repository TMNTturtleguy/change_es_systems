change_es_systems
This script lets you change the es_systems.cfg file used to display systems using your controllers.

v4
TMNTturtlguy - July 9 2017

place script in /home/pi/RetroPie/retropiemenu/
In order to run the script you must create the following folders:
    /opt/retropie/configs/all/emulationstation/es_systems
Then within that folder create these 6 folders:
    All
    Consoles
    Customs
    Favorites
    Hacks
    Neocapcom
 Example of the full path: /opt/retropie/configs/all/emulationstation/es_systems/Favorites
 Within each folder you have created place a es_systems.cfg file. The file needs to be named the same in each folder, but the systems can be different.
 Emulationstation will automatically restart.
 
 Special Thanks to @meleu and @cyperghost for their hard work helping trouble shoot this script and comming up with a way to restart ES.

 
