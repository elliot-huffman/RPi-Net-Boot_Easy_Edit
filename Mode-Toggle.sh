#!/bin/bash

pause () {
  echo "Press any key to continue..."
  read -n 1
}

servermode () {
  chown root:root -R /var/lib/tftpboot/
  chown root:root -R /var/www/html/
  chmod 755 -R /var/lib/tftpboot/
  chmod 755 -R /var/www/html/
  echo "Server mode enabled!"
  echo ""
  pause
  clear
  mainmenu
  }

editmode () {
  chown elliot:elliot -R /var/www/html/
  chown elliot:elliot -R /var/lib/tftpboot/
  clear
  echo "Edit mode enabled!"
  echo ""
  pause
  clear
  mainmenu
  }

quitprogram () {
  clear
  echo "Sorry to see you go... :("
  exit
  }

mainmenu () {
  echo "Press 1 to enable edit mode"
  echo "Press 2 to enable server mode"
  echo "Press x to exit the script"
  read -n 1 -p "Input Selection:" "mainmenuinput"
  if [ "$mainmenuinput" = "1" ]; then
            clear
            editmode
        elif [ "$mainmenuinput" = "2" ]; then
            clear
            servermode
        elif [ "$mainmenuinput" = "x" ];then
            clear
            quitprogram
        elif [ "$mainmenuinput" = "X" ];then
            clear
            quitprogram
        else
            echo "You have entered an invallid selection!"
            echo "Please try again!"
            echo ""
            pause
            clear
            mainmenu
        fi
}
mainmenu
