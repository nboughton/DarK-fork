DarK is a monotone icon theme for X11-themes it can also be used as a fallback icon theme.

![alt text](https://gitlab.com/sixsixfive/dark-icons/raw/master/.preview.png)

### Features:

* Designed to stay in the background, so no disturbing colors
* Recolorable, works even on light themes
* Supports more than 7000 icons from the last decade

### How to install the theme?

#### Debian & Co

```
apt install fakeroot git libfile-fcntllock-perl debhelper sed findutils --no-install-recommends
git clone https://gitlab.com/sixsixfive/DarK-icons.git
cd DarK-icons/packaging
sh build_deb.sh
dpkg -i darksvg-icon-theme_*.deb && apt install -f --no-install-recommends
```

Note: this won't add symbolic icons and app themes

### Howto to build and install the theme?

Just run the build script, you also need to build the svg theme to create the png theme.

Copy the DarK-svg or DarK-png folder to your X11 icon theme dir(usually $SYSPREFIX/share/icons)

The App themes need to be copied to the applications theme folder (see DIRS.README). Note that some themes need to be built first!

### Howto change the Icon-theme color?

Just run the changecolor.sh script!

Note: the App themes cant currently recolor!

