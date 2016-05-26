#!/bin/bash
# Author : Vishal Nagda (Team ATOM)
# Date : 25 May, 2016 23:20
# Version UDB 0.1
# Help For This File :
# OPEN TERMINAL AND TYPE sudo -i AND NOW ENTER YOUR ACCOUNT PASSWORD.
# NOW LOCATE THE DIRECOTRY THAT CONTAIN UDB.sh FILE.
# COPY THIS FILE AND ALL YOUR NEW BACKGROUND IMAGES TO THE DIRECTORY /usr/share/backgrounds/
# NOW LOCATE THE DIRECTORY /usr/share/backgrounds/contest (THIS DIRECTORY MAY BE DIFFERENT IN YOUR CASE, COZ I'M USING UBUNTU 16.04 LTS i.e. XENIAL XERUS).
# MAKE A COPY OF THE ORIGINAL FILE xenial.xml (THIS FILE MAY ALSO BE DIFFERENT IN YOUR CASE).
# NOW GO BACK TO THE PREVIOUS DIRECTORY AND RUN UDB.sh FILE BY TYPING IN TERMINAL ./UDB.sh
# DONE

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

FILE="contest/xenial.xml"
DURATION=1795.0
TRANSITION=5.0

# Random order
IMGS=($(ls *.{jpg,jpeg,png,gif,JPG,JPEG,PNG,GIF} 2>/dev/null | sort -R))
T_IMG=`expr ${#IMGS[*]} - 1`
CURRENTDIR=$(pwd)

echo -e "<background>\n  <starttime>\n    <year>2009</year>\n    <month>08</month>\n    <day>04</day>\n    <hour>00</hour>\n    <minute>00</minute>\n    <second>00</second>\n  </starttime>\n<!-- This animation will start at midnight. -->" > $FILE

for ((i=0;  i<$T_IMG; i++))
do
    echo -e "  <static>\n    <duration>$DURATION</duration>\n    <file>$CURRENTDIR/${IMGS[$i]}</file>\n  </static>" >> $FILE
    echo -e "  <transition>\n    <duration>$TRANSITION</duration>\n    <from>$CURRENTDIR/${IMGS[$i]}</from>" >> $FILE
    echo -e "    <to>$CURRENTDIR/${IMGS[`expr $i + 1`]}</to>\n  </transition>" >> $FILE
done

# last picture to first one
echo -e "  <static>\n    <duration>$DURATION</duration>\n    <file>$CURRENTDIR/${IMGS[$COUNTER]}</file>\n  </static>" >> $FILE
echo -e "  <transition>\n    <duration>$TRANSITION</duration>\n    <from>$CURRENTDIR/${IMGS[$COUNTER]}</from>" >> $FILE
echo -e "    <to>$CURRENTDIR/${IMGS[0]}</to>\n  </transition>" >> $FILE

echo "</background>" >> $FILE

IFS=$SAVEIFS
