#!/usr/bin/sh -x

CSS_FILE="/home/deck/.steam/steam/steamui/css/sp.css"
CSS_FILE_BAK="/home/deck/.steam/steam/steamui/css/sp.css.bak"
rm -rf $CSS_FILE
mv $CSS_FILE_BAK $CSS_FILE
