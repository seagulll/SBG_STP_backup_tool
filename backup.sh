#!/bin/bash


################### Input parameters ##################

USERID="elingyu"
STP="STP18"

DATE=$(date +%Y%m%d_%H%M%S)

suffix=""

for args in $@
do

 if [ "${args:0:2}" = "n_" ]; then
    suffix="${args:2}";
 fi

done


if [ "${suffix}" != "" ]; then
   SUFFIX="_"${suffix};
fi


################### wslint15 backup ####################
function wslint15(){
#mkdir /home/$USERID/SBG/backup/$STP/wslint15/SER1/SER1

mkdir /home/$USERID/SBG/backup/$STP/wslint15/DNS1/DNS1

/home/$USERID/SBG/backup/backup_tool/wslint15.sh

mv /home/$USERID/SBG/backup/$STP/wslint15/network/wl88190_network_config_ /home/$USERID/SBG/backup/$STP/wslint15/network/wl88190_network_config_${DATE}${SUFFIX}.txt

#mv /home/$USERID/SBG/backup/$STP/wslint15/SER1/SER1 /home/$USERID/SBG/backup/$STP/wslint15/SER1/SER1_${DATE}${SUFFIX}

mv /home/$USERID/SBG/backup/$STP/wslint15/DNS1/DNS1 /home/$USERID/SBG/backup/$STP/wslint15/DNS1/DNS1_${DATE}${SUFFIX}
}


################### wslint16 backup ####################
function wslint16(){
#mkdir /home/$USERID/SBG/backup/$STP/wslint16/SER2/SER2

mkdir /home/$USERID/SBG/backup/$STP/wslint16/DNS2/DNS2

/home/$USERID/SBG/backup/backup_tool/wslint16.sh

mv /home/$USERID/SBG/backup/$STP/wslint16/network/wl88191_network_config_ /home/$USERID/SBG/backup/$STP/wslint16/network/wl88191_network_config_${DATE}${SUFFIX}.txt

#mv /home/$USERID/SBG/backup/$STP/wslint16/SER2/SER2 /home/$USERID/SBG/backup/$STP/wslint16/SER2/SER2_${DATE}${SUFFIX}

mv /home/$USERID/SBG/backup/$STP/wslint16/DNS2/DNS2 /home/$USERID/SBG/backup/$STP/wslint16/DNS2/DNS2_${DATE}${SUFFIX}
}


################### wl8819 backup ####################
function wl8819(){
#mkdir /home/$USERID/SBG/backup/$STP/wl8819/xPres/xPres

/home/$USERID/SBG/backup/backup_tool/wl8819.sh

mv /home/$USERID/SBG/backup/$STP/wl8819/network/wl8819_network_config_ /home/$USERID/SBG/backup/$STP/wl8819/network/wl8819_network_config_${DATE}${SUFFIX}.txt

#mv /home/$USERID/SBG/backup/$STP/wl8819/xPres/xPres /home/$USERID/SBG/backup/$STP/wl8819/xPres/xPres_${DATE}${SUFFIX}
}


################### wl9339 backup ####################
function wl9339(){
#mkdir /home/$USERID/SBG/backup/$STP/wl9339/xPres/xPres

/home/$USERID/SBG/backup/backup_tool/wl9339.sh

mv /home/$USERID/SBG/backup/$STP/wl9339/network/wl9339_network_config_ /home/$USERID/SBG/backup/$STP/wl9339/network/wl9339_network_config_${DATE}${SUFFIX}.txt

#mv /home/$USERID/SBG/backup/$STP/wl9339/xPres/xPres /home/$USERID/SBG/backup/$STP/wl9339/xPres/xPres_${DATE}${SUFFIX}
}


################### titansim37 backup ####################
function titansim37(){
mkdir /home/$USERID/SBG/backup/$STP/titansim37/scripts/scripts

/home/$USERID/SBG/backup/backup_tool/titansim37.sh

rm -rf /home/$USERID/SBG/backup/$STP/titansim37/scripts/scripts/playlist.e*

rm -rf /home/$USERID/SBG/backup/$STP/titansim37/scripts/scripts/release_evolution*

mv /home/$USERID/SBG/backup/$STP/titansim37/network/interfaces /home/$USERID/SBG/backup/$STP/titansim37/network/interfaces_${DATE}${SUFFIX}

mv /home/$USERID/SBG/backup/$STP/titansim37/scripts/scripts /home/$USERID/SBG/backup/$STP/titansim37/scripts/scripts_${DATE}${SUFFIX}
}


################### titansim65 backup ####################
function titansim65(){
mkdir /home/$USERID/SBG/backup/$STP/titansim65/scripts/scripts

/home/$USERID/SBG/backup/backup_tool/titansim65.sh

rm -rf /home/$USERID/SBG/backup/$STP/titansim65/scripts/scripts/playlist.e*

rm -rf /home/$USERID/SBG/backup/$STP/titansim65/scripts/scripts/release_evolution*

mv /home/$USERID/SBG/backup/$STP/titansim65/network/interfaces /home/$USERID/SBG/backup/$STP/titansim65/network/interfaces_${DATE}${SUFFIX}

mv /home/$USERID/SBG/backup/$STP/titansim65/scripts/scripts /home/$USERID/SBG/backup/$STP/titansim65/scripts/scripts_${DATE}${SUFFIX}
}


################### sbg-xt018 backup ####################
function sbg-xt018(){
/home/$USERID/SBG/backup/backup_tool/sbg-xt018.sh

dos2unix /home/$USERID/SBG/backup/backup_tool/sbg-xt018_show_

python /home/$USERID/SBG/backup/backup_tool/rm_xt018_illegal_char.py

mv /home/$USERID/SBG/backup/backup_tool/sbg-xt018_show_ /home/$USERID/SBG/backup/$STP/Switch/sbg-xt018_show_${DATE}${SUFFIX}.txt
}


################### bgf02 backup ####################
#function bgf02(){
#/home/$USERID/SBG/backup/backup_tool/bgf02.sh

#dos2unix /home/$USERID/SBG/backup/backup_tool/BGF_show_

#python /home/$USERID/SBG/backup/backup_tool/rm_bgf_illegal_char.py

#mv /home/$USERID/SBG/backup/backup_tool/BGF_show_ /home/$USERID/SBG/backup/$STP/BGFs/BGF02_show_${DATE}${SUFFIX}.txt
#}


################### bgf06 backup ####################
function bgf06(){
/home/$USERID/SBG/backup/backup_tool/bgf06.sh

dos2unix /home/$USERID/SBG/backup/backup_tool/BGF_show_

python /home/$USERID/SBG/backup/backup_tool/rm_bgf_illegal_char.py

mv /home/$USERID/SBG/backup/backup_tool/BGF_show_ /home/$USERID/SBG/backup/$STP/BGFs/BGF06_show_${DATE}${SUFFIX}.txt
}


################### bgf07 backup ####################
function bgf07(){
/home/$USERID/SBG/backup/backup_tool/bgf07.sh

dos2unix /home/$USERID/SBG/backup/backup_tool/BGF_show_

python /home/$USERID/SBG/backup/backup_tool/rm_bgf_illegal_char.py

mv /home/$USERID/SBG/backup/backup_tool/BGF_show_ /home/$USERID/SBG/backup/$STP/BGFs/BGF07_show_${DATE}${SUFFIX}.txt
}


################### bgf11 backup ####################
function bgf11(){
/home/$USERID/SBG/backup/backup_tool/bgf11.sh

dos2unix /home/$USERID/SBG/backup/backup_tool/BGF_show_

python /home/$USERID/SBG/backup/backup_tool/rm_bgf_illegal_char.py

mv /home/$USERID/SBG/backup/backup_tool/BGF_show_ /home/$USERID/SBG/backup/$STP/BGFs/BGF11_show_${DATE}${SUFFIX}.txt
}


################### bgf12 backup ####################
function bgf12(){
/home/$USERID/SBG/backup/backup_tool/bgf12.sh

dos2unix /home/$USERID/SBG/backup/backup_tool/BGF_show_

python /home/$USERID/SBG/backup/backup_tool/rm_bgf_illegal_char.py

mv /home/$USERID/SBG/backup/backup_tool/BGF_show_ /home/$USERID/SBG/backup/$STP/BGFs/BGF12_show_${DATE}${SUFFIX}.txt
}

################### isers backup ####################
function isers(){
/home/$USERID/SBG/backup/backup_tool/isers.sh

mv /home/$USERID/SBG/backup/$STP/ISERs/ISER1.conf /home/$USERID/SBG/backup/$STP/ISERs/ISER1_$STP.conf_iser_${DATE}${SUFFIX}

mv /home/$USERID/SBG/backup/$STP/ISERs/ISER2.conf /home/$USERID/SBG/backup/$STP/ISERs/ISER2_$STP.conf_iser_${DATE}${SUFFIX}
}


################### Main ####################


if [ -n "$1" ]; then
  echo "Start backup ..."; 
else
  echo "Please enter the correct server name: wslint15, wslint16, wl8819, wl9339, titansim37, titansim65, sbg-xt018, bgf06, bgf07, bgf11, bgf12, isers, or all.";
exit;
fi


for args in $@
do

  if [ "${args:0:2}" != "n_" ] && [ "$args" != "wslint15" ] && [ "$args" != "wslint16" ] && [ "$args" != "wl8819" ] && [ "$args" != "wl9339" ] && [ "$args" != "titansim37" ] && [ "$args" != "titansim65" ] && [ "$args" != "sbg-xt018" ] && [ "$args" != "bgf06" ] && [ "$args" != "bgf07" ] && [ "$args" != "bgf11" ] && [ "$args" != "bgf12" ] && [ "$args" != "isers" ] && [ "$args" != "all" ];
  then
     echo "Can not find the server name: $args";
     exit;
  fi

done


for args in $@
do

  if [ "$args" = "wslint15" ]; then
     wslint15;
  elif [ "$args" = "wslint16" ]; then
     wslint16;
  elif [ "$args" = "wl8819" ]; then
     wl8819;
  elif [ "$args" = "wl9339" ]; then
     wl9339;
  elif [ "$args" = "titansim37" ]; then
     titansim37;
  elif [ "$args" = "titansim65" ]; then
     titansim65;
  elif [ "$args" = "sbg-xt018" ]; then
     sbg-xt018;
  elif [ "$args" = "bgf06" ]; then
     bgf06;
  elif [ "$args" = "bgf07" ]; then
     bgf07;
  elif [ "$args" = "bgf11" ]; then
     bgf11;
  elif [ "$args" = "bgf12" ]; then
     bgf12;
  elif [ "$args" = "isers" ]; then
     isers;
  elif [ "$args" = "all" ]; then
     wslint15;
     wslint16;
     wl8819;
     wl9339;
     titansim37;
     titansim65;
     sbg-xt018;
     bgf06;
     bgf07;
     bgf11;
     bgf12;
     isers;
   fi

done




