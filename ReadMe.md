DarK is a monotone icon theme for Dark desktops.

![alt text](https://gitlab.com/sixsixfive/DarK/raw/master/preview.png)

### Features:

* Designed to stay in the background, so no disturbing colors
* Recolorable
* supports more than 7000 icons from the last decade

```
make deb
su -c 'dpkg -i dark-theme_*.deb && apt install -f --no-install-recommends'
```

## Howto install on other distributions

```
make PREFIX=/usr
```

## What icon themes are included?

* aMule
* DolphinEmu
* FileZilla
* Gajim
* IceWM
* Pidgin
* Scribus
* X11/Freedesktop

### Howto change the Icon-theme color?

Just run the [changecolor.sh](https://gitlab.com/sixsixfive/DarK/blob/master/icons/DarK/changecolor.sh) script! eg:

### Icons are unavailable in IceWM

Your IceWM needs to have PNG support otherwise you can create xpm files with the [icons_xpm.sh](https://gitlab.com/sixsixfive/DarK/blob/master/DarK/Extras/App_themes/icewm/DarK/icons_xpm.sh) script.

PS: Keep in mind that not all icons are loaded from the themes folder the dark icon theme folder mus be part of the IconPath key in your preferences file.

PPS: the theme only supports 16px icons so make sure you set all IconSizes in your preferences to 16px!
