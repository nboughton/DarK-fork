DarK is a monotone icon theme for X11-themes it can also be used as a fallback icon theme.

![alt text](https://gitlab.com/sixsixfive/dark-icons/raw/master/.preview.png)

### Features:

* Designed to stay in the background, so no disturbing colors
* Recolorable, works even on light themes
* Supports more than 7000 icons from the last decade

### Howto to build the theme?

Just run the build script, you also need to build the svg theme to create the png theme.

##### What is better SVG or PNG theme.

PNG needs longer to build, but is a lot more resource friendly and more compatible than SVG files. 

### Howto install the theme?

Copy the Dark-svg or DarK-png folder to your X11 icon theme dir(usually $SYSPREFIX/share/icons)

The App themes need to be copied to the applications theme folder (see DIRS.README). Note that some themes need to be built first!

### Howto change the Icon-theme color?

Just run the changecolor.sh script!

### Throbber (activity icon in GTK3 won't work)

That is an issue with GTK3 since the most themes still use the animation icons from the X11/freedesktop themes which are multiple images instead of one. 
I will not change this since this would break other desktops so to change this add the following text to your GTK3 css file(eg $HOME/.config/gtk-3.0/gtk.css):


```
spinner{
-gtk-icon-source: -gtk-icontheme("progress-0");}
```
