#!/usr/bin/sh -x

CSS_FILE="/home/deck/.steam/steam/steamui/css/sp.css"

cat $CSS_FILE | grep "@keyframes steamdeckbootupthrobber_ItemFocusAnim-darkerGrey-nocolor_p" | tr -d '\n\r'> TMP.txt
sed -i 's/@keyframes/\n@keyframes/g' TMP.txt
sed -i 's/}\./}\n\./g' TMP.txt
sed -i 's/background-color:.*;/background-color:MAIN_COLOR;/g' TMP.txt
sed -i 's/{from{background:#.*;color:#.*}to{background:#.*;color:#.*}}/{from{background:MAIN_COLOR;color:MAIN_COLOR}to{background:MAIN_COLOR;color:MAIN_COLOR}}/g' TMP.txt
sed -i 's/{from{background:#.*}to{background:#.*}}/{from{background:MAIN_COLOR}to{background:MAIN_COLOR}}/g' TMP.txt
tr -d '\n' < TMP.txt > TMP2.txt
rm TMP.txt
mv TMP2.txt TMP.txt

CSS_SIZE=$(stat -c%s $CSS_FILE)
sed -i '/steamdeckbootupthrobber_ItemFocusAnim/c\obsidian_placeholder' $CSS_FILE

MAIN_COLOR_NAME=$(cat ../../Obsidian/config_USER.json | cut -d ":" -f3 | cut -d "\"" -f2) 
case "$MAIN_COLOR_NAME" in
    "Black")
        MAIN_COLOR="#000000"
    ;;
    "Dark Gray")
        MAIN_COLOR="#121212"
    ;;
    "Gray")
        MAIN_COLOR="#181818"
    ;;
    "Red")
        MAIN_COLOR="#271414"
    ;;
    "Orange")
        MAIN_COLOR="#2b1c0b"
    ;;
    "Yellow")
        MAIN_COLOR="#222209"
    ;;
    "Green")
        MAIN_COLOR="#142714"
    ;;
    "Blue")
        MAIN_COLOR="#141427"
    ;;
    "Indigo")
        MAIN_COLOR="#1d1427"
    ;;
    "Violet")
        MAIN_COLOR="#231427"
    ;;
    *)
        MAIN_COLOR="#000000"
    ;;
esac

sed -i "s/MAIN_COLOR/$MAIN_COLOR/g" TMP.txt
sed -i '/obsidian_placeholder/rTMP.txt' $CSS_FILE
sed -i "s/$MAIN_COLOR/MAIN_COLOR/g" TMP.txt
sed -i '/obsidian_placeholder/d' $CSS_FILE
truncate --size=$CSS_SIZE $CSS_FILE
rm -Rf TMP.txt
