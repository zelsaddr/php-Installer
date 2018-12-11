#!/bin/bash

# Created by @_zelsaddr
clear
merah="\033[1;31m"
kunig="\033[1;33m"
hijau="\033[1;32m"
biru="\033[1;34m"
cyan="\033[0;36m"
hapud="\033[0m"
putij="\033[37m"
if [[ $EUID -ne 0 ]]; then
   echo -e  $merah"[!] This script must be run as root"$hapud
   exit 1
fi
echo -ne $kunig"[?] Are you sure? [y/n] "$hapud
read opt
if [[ $opt == "y" ]]; then
    PHP_VERSION=$(php -v | grep -i "5.6")
    if [[ $PHP_VERSION ]]; then
        echo -e $hijau"[!] You already installed PHP 5.6 Version"$hapud
        exit 2
    fi
    echo -e $kunig"[>] Installing Software Properties Common .."$hapud
    sleep 1
        apt-get install software-properties-common -y &> /dev/null
    echo -e $cyan"[>] Add Repository PHP .."$hapud
    sleep 1
        add-apt-repository ppa:ondrej/php -y &> /dev/null
    echo -e $hijau"[>] Updating Repo .."$hapud
    sleep 1
        apt-get update &> /dev/null
    echo -e $biru"[!] Installing all php5.6 requirements .."$hapud
    sleep 1
        apt-get install php5.6 php5.6-mcrypt php5.6-mbstring php5.6-curl php5.6-cli php5.6-mysql php5.6-gd php5.6-bcmath php5.6-intl php5.6-xsl -y &> /dev/null
    phpv=$(php -v | grep -i "5.6")
    if [[ $phpv ]]; then
        echo -e $cyan"[>] Success Changing PHP Version to 5.6"$hapud
    else
        echo -e $merah"[!] Failed to Changing PHP Version."$hapud
    fi
    echo -e $hijau"[!] Done!, Exiting.."$hapud
    exit 2
else
    echo -e $merah"[!] Okay, Im exiting .."$hapud
    exit 2
fi
