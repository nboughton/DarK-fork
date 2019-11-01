#!/bin/sh
set -e
(command -v rsvg-convert &>/dev/null||exit 1)
(command -v convert &>/dev/null||exit 1)
(command -v optipng &>/dev/null||exit 1)
(command -v gtk-encode-symbolic-svg &>/dev/null||exit 1)
if [ ! -t 0 ]; then
	x-terminal-emulator -e "$0"
	exit 0
fi
basedir=`dirname "$(readlink -f "${0}")"`
cd ${basedir}
if [ -d ${basedir}/DarK ]; then
	rm -rf ${basedir}/DarK
fi
mkdir ${basedir}/DarK
cp -R 8x8 ${basedir}/DarK/8x8
cp -R scalable ${basedir}/DarK/16x16
cp -R scalable ${basedir}/DarK/22x22
cp -R scalable ${basedir}/DarK/24x24
cp -R scalable ${basedir}/DarK/32x32
cp -R scalable ${basedir}/DarK/48x48
cp -R scalable ${basedir}/DarK/256x256
cd ${basedir}/DarK/8x8/emblems
for _file in $(find -type f -name '*.svg'); do
	rsvg-convert -w 8 -h 8 -f png -o $(echo $_file|sed s'/.svg/.png/') $_file
	optipng -quiet -nb -strip all $(echo $_file|sed 's#.svg#.png#')
	if [ -f "$(echo $_file|sed s'/.svg/.png/')" ]; then
		rm -f $_file
	fi
done
for _svgsymlink in $(find -type l -name '*.svg'); do
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.png#')" "$(ls $_svgsymlink|sed 's#.svg$#.png#')"
	if [ -f "$(echo $_svgsymlink|sed s'/.svg/.png/')" ]; then
		rm -f $_svgsymlink
	fi
done
###16
cd ${basedir}/DarK/16x16
for _file in $(find -type f -name '*.svg'); do
	rsvg-convert -a -h 16 -f png -o $(echo $_file|sed 's#.svg#.png#') $_file
	optipng -quiet -nb -strip all $(echo $_file|sed 's#.svg#.png#')
	mkdir -p ${basedir}/DarK/16x16/symbolic
	gtk-encode-symbolic-svg -o "${basedir}/DarK/16x16/symbolic" $_file 16x16
	if [ -f "$(echo $_file|sed s'/.svg/.png/')" ]; then
		rm -f $_file
	fi
done
for _svgsymlink in $(find -type l -name '*.svg'); do
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.png#')" "$(ls $_svgsymlink|sed 's#.svg$#.png#')"
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.symbolic.png#')" ${basedir}/DarK/16x16/symbolic/"$(echo $_svgsymlink|sed 's#^.*/##'|sed 's#.svg$#.symbolic.png#')"
	rm -f $_svgsymlink
done
###22
cd ${basedir}/DarK/22x22
for _file in $(find -type f -name '*.svg'); do
	sed -i 's/viewBox="0 0 16 16"/viewBox="-3 -3 22 22"/' $_file
	rsvg-convert -a -h 22 -f png -o $(echo $_file|sed 's#.svg#.png#') $_file
	optipng -quiet -nb -strip all $(echo $_file|sed 's#.svg#.png#')
	mkdir -p ${basedir}/DarK/22x22/symbolic
	gtk-encode-symbolic-svg -o "${basedir}/DarK/22x22/symbolic" $_file 22x22
	if [ -f "$(echo $_file|sed s'/.svg/.png/')" ]; then
		rm -f $_file
	fi
done
for _svgsymlink in $(find -type l -name '*.svg'); do
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.png#')" "$(ls $_svgsymlink|sed 's#.svg$#.png#')"
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.symbolic.png#')" ${basedir}/DarK/22x22/symbolic/"$(echo $_svgsymlink|sed 's#^.*/##'|sed 's#.svg$#.symbolic.png#')"
	rm -f $_svgsymlink
done
rm -rf ${basedir}/DarK/22x22/animations
###24
cd ${basedir}/DarK/24x24
for _file in $(find -type f -name '*.svg'); do
	sed -i 's/viewBox="0 0 16 16"/viewBox="-4 -4 24 24"/' $_file
	rsvg-convert -a -h 24 -f png -o $(echo $_file|sed 's#.svg#.png#') $_file
	optipng -quiet -nb -strip all $(echo $_file|sed 's#.svg#.png#')
	mkdir -p ${basedir}/DarK/24x24/symbolic
	gtk-encode-symbolic-svg -o "${basedir}/DarK/24x24/symbolic" $_file 24x24
	if [ -f "$(echo $_file|sed s'/.svg/.png/')" ]; then
		rm -f $_file
	fi
done
for _svgsymlink in $(find -type l -name '*.svg'); do
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.png#')" "$(ls $_svgsymlink|sed 's#.svg$#.png#')"
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.symbolic.png#')" ${basedir}/DarK/24x24/symbolic/"$(echo $_svgsymlink|sed 's#^.*/##'|sed 's#.svg$#.symbolic.png#')"
	rm -f $_svgsymlink
done
rm -rf ${basedir}/DarK/24x24/animations
###32
cd ${basedir}/DarK/32x32
for _file in $(find -type f -name '*.svg'); do
	sed -i 's/viewBox="0 0 16 16"/viewBox="0 0 16 16" width="32" height="32"/' $_file
	rsvg-convert -a -h 32 -f png -o $(echo $_file|sed 's#.svg#.png#') $_file
	optipng -quiet -nb -strip all $(echo $_file|sed 's#.svg#.png#')
	mkdir -p ${basedir}/DarK/32x32/symbolic
	gtk-encode-symbolic-svg -o "${basedir}/DarK/32x32/symbolic" $_file 32x32
	if [ -f "$(echo $_file|sed s'/.svg/.png/')" ]; then
		rm -f $_file
	fi
done
for _svgsymlink in $(find -type l -name '*.svg'); do
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.png#')" "$(ls $_svgsymlink|sed 's#.svg$#.png#')"
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.symbolic.png#')" ${basedir}/DarK/32x32/symbolic/"$(echo $_svgsymlink|sed 's#^.*/##'|sed 's#.svg$#.symbolic.png#')"
	rm -f $_svgsymlink
done
###48
cd ${basedir}/DarK/48x48
for _file in $(find -type f -name '*.svg'); do
	sed -i 's/viewBox="0 0 16 16"/viewBox="-4 -4 24 24" width="48" height="48"/' $_file
	rsvg-convert -a -h 48 -f png -o $(echo $_file|sed 's#.svg#.png#') $_file
	optipng -quiet -nb -strip all $(echo $_file|sed 's#.svg#.png#')
	mkdir -p ${basedir}/DarK/48x48/symbolic
	gtk-encode-symbolic-svg -o "${basedir}/DarK/48x48/symbolic" $_file 48x48
	if [ -f "$(echo $_file|sed s'/.svg/.png/')" ]; then
		rm -f $_file
	fi
done
for _svgsymlink in $(find -type l -name '*.svg'); do
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.png#')" "$(ls $_svgsymlink|sed 's#.svg$#.png#')"
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.symbolic.png#')" ${basedir}/DarK/48x48/symbolic/"$(echo $_svgsymlink|sed 's#^.*/##'|sed 's#.svg$#.symbolic.png#')"
	rm -f $_svgsymlink
done
###256
cd ${basedir}/DarK/256x256
for _file in $(find -type f -name '*.svg'); do
	rsvg-convert -a -h 256 -f png -o $(echo $_file|sed 's#.svg#.png#') $_file
	optipng -quiet -nb -strip all $(echo $_file|sed 's#.svg#.png#')
	mkdir -p ${basedir}/DarK/256x256/symbolic
	gtk-encode-symbolic-svg -o "${basedir}/DarK/256x256/symbolic" $_file 256x256
	if [ -f "$(echo $_file|sed s'/.svg/.png/')" ]; then
		rm -f $_file
	fi
done
for _svgsymlink in $(find -type l -name '*.svg'); do
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.png#')" "$(ls $_svgsymlink|sed 's#.svg$#.png#')"
	ln -sf "$(readlink $_svgsymlink|sed 's#.svg$#.symbolic.png#')" ${basedir}/DarK/256x256/symbolic/"$(echo $_svgsymlink|sed 's#^.*/##'|sed 's#.svg$#.symbolic.png#')"
	rm -f $_svgsymlink
done

cd ${basedir}/DarK
find -name 0-temp-*.png -exec rm {} \;

####index.theme
	printf "\nCreating theme index...\n"
	cat <<\EOF > ${basedir}/DarK/index.theme
[Icon Theme]
Name=DarK
Comment=Simple monotone icons for X11 desktops
Example=face-wink
Inherits=hicolor
Hidden=false

##KDE
DesktopDefault=48
DesktopSizes=16,22,24,32,48,64,96,128,256
ToolbarDefault=22
ToolbarSizes=16,22,24,32,48,64,96,128,256
MainToolbarDefault=22
MainToolbarSizes=16,22,24,32,48,64,96,128,256
SmallDefault=16
SmallSizes=16,22,24,32,48,64,96,128,256
PanelDefault=22
PanelSizes=116,22,24,32,48,64,96,128,256
DialogDefault=48
DialogSizes=16,22,24,32,48,64,96,128,256
KDE-Extensions=.png
DisplayDepth=32
FollowsColorScheme=false

##Dirs
Directories=8x8/emblems,16x16/animations,16x16/emblems,16x16/emblems-gnome,16x16/intl,16x16/pool,16x16/symbolic,22x22/animations,22x22/emblems,22x22/emblems-gnome,22x22/intl,22x22/pool,22x22/symbolic,24x24/animations,24x24/emblems,24x24/emblems-gnome,24x24/intl,24x24/pool,24x24/symbolic,32x32/animations,32x32/emblems,32x32/emblems-gnome,32x32/intl,32x32/pool,32x32/symbolic,48x48/animations,48x48/emblems,48x48/emblems-gnome,48x48/intl,48x48/pool,48x48/symbolic,256x256/animations,256x256/emblems,256x256/emblems-gnome,256x256/intl,256x256/pool,256x256/symbolic

[8x8/emblems]
Size=8
Context=Emblems
Type=Threshold

[16x16/animations]
Size=16
Context=Animations
Type=Threshold

[16x16/emblems]
Size=16
Context=Emblems
Type=Threshold

[16x16/intl]
Size=16
Context=International
Type=Threshold

[16x16/emblems-gnome]
Size=16
Type=Threshold

[16x16/pool]
Size=16
Type=Threshold

[16x16/symbolic]
Size=16
Type=Threshold

[22x22/animations]
Size=22
Context=Animations
Type=Threshold

[22x22/emblems]
Size=22
Context=Emblems
Type=Threshold

[22x22/intl]
Size=22
Context=International
Type=Threshold

[22x22/emblems-gnome]
Size=22
Type=Threshold

[22x22/pool]
Size=22
Type=Threshold

[22x22/symbolic]
Size=22
Type=Threshold

[24x24/animations]
Size=24
Context=Animations
Type=Threshold

[24x24/emblems]
Size=24
Context=Emblems
Type=Threshold

[24x24/intl]
Size=24
Context=International
Type=Threshold

[24x24/emblems-gnome]
Size=24
Type=Threshold

[24x24/pool]
Size=24
Type=Threshold

[24x24/symbolic]
Size=24
Type=Threshold

[32x32/animations]
Size=32
Context=Animations
Type=Threshold

[32x32/emblems]
Size=32
Context=Emblems
Type=Threshold

[32x32/intl]
Size=32
Context=International
Type=Threshold

[32x32/emblems-gnome]
Size=32
Type=Threshold

[32x32/pool]
Size=32
Type=Threshold

[32x32/symbolic]
Size=32
Type=Threshold

[48x48/animations]
Size=48
Context=Animations
Type=Threshold

[48x48/emblems]
Size=48
Context=Emblems
Type=Threshold

[48x48/intl]
Size=48
Context=International
Type=Threshold

[48x48/emblems-gnome]
Size=48
Type=Threshold

[48x48/pool]
Size=48
Type=Threshold

[48x48/symbolic]
Size=48
Type=Threshold

[256x256/animations]
Size=256
Context=Animations
Type=Scalable
MinSize=46
MaxSize=240

[256x256/emblems]
Size=256
Context=Emblems
Type=Scalable
MinSize=46
MaxSize=240

[256x256/intl]
Size=256
Context=International
Type=Scalable
MinSize=46
MaxSize=240

[256x256/emblems-gnome]
Size=256
Type=Scalable
MinSize=46
MaxSize=240

[256x256/pool]
Size=256
Type=Scalable
MinSize=46
MaxSize=240

[256x256/symbolic]
Size=256
Type=Scalable
MinSize=46
MaxSize=240

EOF
cp "$basedir"/COPYING ${basedir}/DarK/COPYING
cp "$basedir"/LICENSE ${basedir}/DarK/LICENSE
cp -r ${basedir}/App_themes ${basedir}/DarK/
if type gtk-update-icon-cache &>/dev/null; then
	gtk-update-icon-cache -f "${basedir}/DarK"
elif type gtk-update-icon-cache-3.0 &>/dev/null; then
	gtk-update-icon-cache-3.0 -f "${basedir}/DarK"
fi
sh ${basedir}/DarK/App_themes/amule_dark/build.sh
rm -rf ${basedir}/DarK/App_themes/amule_dark_src
rm -f ${basedir}/DarK/App_themes/build.sh
if [ "$USER" = "ssf" ];then
	if [ -d "/home/$USER/Gitlab/DarK-icons/DarK" ];then
	rm -rf "/home/$USER/Gitlab/DarK-icons/DarK"
	mkdir -p /home/$USER/Gitlab/DarK-icons/DarK
	cp -R ${basedir}/DarK/* /home/ssf/Gitlab/DarK-icons/DarK/
	fi
fi

printf "\ndone\n"
