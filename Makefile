PREFIX = /usr/local
THEME = DarK
DESTDIR = $(PREFIX)
SYSCONFDIR = /etc
XSESSIONCONFDIR = $(SYSCONFDIR)/X11/Xsession.d
ICONTHEMEDIR = $(PREFIX)/share/icons
####EXTRAS! -FIXME! but no priority!
AMULEICONTHEMEDIR = $(PREFIX)/share/amule/skins
DOLPHINEMUICONTHEMEDIR = $(PREFIX)/share/games/dolphin-emu/sys/Themes
EMOTICONSICONTHEMEDIR = $(PREFIX)/share/emoticons
FILEZILLAICONTHEMEDIR = $(PREFIX)/share/filezilla/resources
GAJIM2ICONTHEMEDIR = $(PREFIX)/share/gajim/data/iconsets
GAJIM3ICONTHEMEDIR = $(PREFIX)/lib/python3/dist-packages/gajim/data/iconsets
GIMP2ICONTHEMEDIR = $(PREFIX)/share/gimp/2.0/icons
SCRIBUSICONTHEMEDIR = $(PREFIX)/share/scribus/icons

.PHONY: install installextras uninstall uninstallextras deb
info:
	@echo ""
	@echo "run \"make deb\" to build a debian unstable package that contains everything"
	@echo ""
	@echo "run \"make install\" to install the $(THEME)-theme to $(PREFIX)"
	@echo "run \"make uninstall\" to uninstall the $(THEME)-theme from $(PREFIX)"
	@echo ""
	@echo "!!!The following are also available but completly unspported!!!"
	@echo "run \"make installextras\" to install all the subthemes to $(PREFIX)"
	@echo "run \"make uninstallextras\" to uninstall all subthemes from $(PREFIX)"
	@echo ""

.ONESHELL:
SHELL = /bin/bash
#.SHELLFLAGS = -ex
#bashism here, so force bash!
install:
#BASEICONS
	for _dir in $$(find icons -type d -not -type f -not -type l); do \
		install -d "$${_dir/icons/$(ICONTHEMEDIR)}" ;\
	done;
	for _file in $$(find icons -type f -not -type d -not -type l); do \
		install -D "$$_file" "$${_file/icons/$(ICONTHEMEDIR)}" ;\
	done;
	for _link in $$(find icons -type l); do \
		cp -P  "$$_link" "$${_link/icons/$(ICONTHEMEDIR)}" ;\
	done;

installextras:
#iconsthemes
	install -d $(AMULEICONTHEMEDIR)
	install -d $(DOLPHINEMUICONTHEMEDIR)
	install -d $(EMOTICONSICONTHEMEDIR)
	install -d $(FILEZILLAICONTHEMEDIR)
	install -d $(GAJIM2ICONTHEMEDIR)
	install -d $(GAJIM3ICONTHEMEDIR)
	install -d $(GIMP2ICONTHEMEDIR)
	ln -s $(ICONTHEMEDIR)/$(THEME)/App_themes/amule_dark/amule_dark.zip $(AMULEICONTHEMEDIR)/amule_dark.zip
	ln -s $(ICONTHEMEDIR)/$(THEME)/App_themes/dolphinemu_dark $(DOLPHINEMUICONTHEMEDIR)/$(THEME)
	ln -s $(ICONTHEMEDIR)/$(THEME)/App_themes/emoticon_dark $(EMOTICONSICONTHEMEDIR)/$(THEME)
	ln -s $(ICONTHEMEDIR)/$(THEME)/App_themes/filezilla_dark $(FILEZILLAICONTHEMEDIR)/$(THEME)
	ln -s $(ICONTHEMEDIR)/$(THEME)/App_themes/gajim_dark $(GAJIM2ICONTHEMEDIR)/$(THEME)
	ln -s $(ICONTHEMEDIR)/$(THEME)/App_themes/gajim_dark $(GAJIM3ICONTHEMEDIR)/$(THEME)
	ln -s $(ICONTHEMEDIR)/$(THEME) $(GIMP2ICONTHEMEDIR)/$(THEME)
	ln -s $(ICONTHEMEDIR)/$(THEME)/App_themes/scribus_dark/$(THEME) $(SCRIBUSICONTHEMEDIR)/$(THEME)
	install -D $(ICONTHEMEDIR)/$(THEME)/App_themes/scribus_dark/$(THEME).xml $(SCRIBUSICONTHEMEDIR)/$(THEME).xml
	install -D $(CURDIR)/99_enable_pidgin_theme_dark $(XSESSIONCONFDIR)/99_enable_pidgin_theme_dark

#full deb package
deb:
	fakeroot debian/rules binary
uninstall:
	rm -rf $(ICONTHEMEDIR)/$(THEME)
#Appthemes
uninstallextras:
	rm -f $(AMULEICONTHEMEDIR)/amule_dark.zip
	rm -rf $(DOLPHINEMUICONTHEMEDIR)/$(THEME)
	rm -rf $(EMOTICONSICONTHEMEDIR)/$(THEME)
	rm -rf $(FILEZILLAICONTHEMEDIR)/$(THEME)
	rm -rf $(GAJIM2ICONTHEMEDIR)/$(THEME)
	rm -rf $(GAJIM3ICONTHEMEDIR)/$(THEME)
	rm -rf $(GIMP2ICONTHEMEDIR)/$(THEME)
	rm -rf $(SCRIBUSICONTHEMEDIR)/$(THEME)
	rm -f $(SCRIBUSICONTHEMEDIR)/$(THEME).xml
	rm -f $(XSESSIONCONFDIR)/99_disable_gtk3_overlay_scrollbars_dark
