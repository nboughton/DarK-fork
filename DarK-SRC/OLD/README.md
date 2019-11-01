
![alt text](https://raw.githubusercontent.com/sixsixfive/Monotone/master/.preview.png)

Monotone was maily made for the use with my [0nyX](https://github.com/sixsixfive/0nyX) and [DarK](https://github.com/sixsixfive/DarK) themes however it can be used as a seperate icon theme. The icon theme contains over 1300 scalable icons to cover more than 5500 icons from the last linux decade and it should work on any X11 desktop environment that supports freedesktop icon themes.

## Installation

NOTE: its also recommended to uninstall the Adwaita-icon theme since its always peloaded in GTK3 and might cause issues!

You can also append [this file](https://github.com/sixsixfive/DarK/blob/master/DarK/gtk-2.0/theme/iconoverridesr.c) to your GTK2 RC file to re-theme several hardcoded icons.

### Packages

you can install the [debian](https://github.com/sixsixfive/Monotone/blob/master/debian/monotone-icon-theme-current.deb?raw=true) package with: 

```
su -c "dpkg -i monotone-icon-theme-current.deb || apt install -f --no-install-recommends"
```

Note: the debian package will install all App themes(the Pidgin tray theme will be available after the first xsession restart)


### Manual

Just download and extract the [master.zip](https://github.com/sixsixfive/Monotone/archive/master.zip) and copy the monotone folder to $SYSPREFIX/share/icons

Note: that the App_themes should be linked to keep the colorchange script intact!

### FAQ

## Changing the color

Just run the script inside the themedir.

NOTE: that needs quite some time since it will rebuild the whole theme!
