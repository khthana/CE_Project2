#!/bin/bash
#
# Copyright: ISAG Honeypot Program Suite Project <zeek.isag@gmail.com>
# NAME: honeypot_install_program.sh
# VERSION: beta
# PURPOSE: Honeywall configuration
# Programmer: Mr.Tanawach Limpadtanachai

# Beginning Configuration Menu Interface

while true
do
   _opt=$(/usr/bin/dialog --stdout --no-cancel  --shadow \
          --backtitle "ISAG HONEYPOT PROGRAM SUITE 2006" \
          --title "ISAG Honeypot  Program suite 2006 Installation" \
          --menu "     [Select Configuration Topics]" 20 50 11 \
          1 "Install Honeywall" \
          2 "Install Cage" \
          3 "Install Logserver" \
          4 "Exit" )

   case ${_opt} in
       1)  ./install_hw.sh;;
       2)  ./install_cg.sh;;
       3)  ./install_lg.sh;;
       4)  exit;;
   esac
done
