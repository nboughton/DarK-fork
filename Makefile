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
GAJIMICONTHEMEDIR = $(PREFIX)/share/gajim/iconsets
#GAJIM3ICONTHEMEDIR = $(PREFIX)/lib/python3/dist-packages/gajim/data/iconsets
GIMP2ICONTHEMEDIR = $(PREFIX)/share/gimp/2.0/icons
SCRIBUSICONTHEMEDIR = $(PREFIX)/share/scribus/icons

.PHONY: install installextras uninstall uninstallextras deb rpm

info:
	@echo ""
	@echo "run \"make deb\" to build a Debian Unstable package that contains everything"
	@echo ""
	@echo "run \"make rpm\" to build a SuSE Tumbleweed package that contains everything"
	@echo ""
	@echo "run \"make install\" to install the $(THEME)-theme to $(PREFIX)"
	@echo "run \"make uninstall\" to uninstall the $(THEME)-theme from $(PREFIX)"
	@echo ""
	@echo "!!!The following are also available but completly unspported!!!"
	@echo "run \"make installextras\" to install all the subthemes to $(PREFIX)"
	@echo "run \"make uninstallextras\" to uninstall all subthemes from $(PREFIX)"
	@echo ""

install:
#BASEICONS
#--replaced all the bash builtins with echo/sed - takes now far longer... 
	for _dir in $$(find DarK -type d -not -type f -not -type l); do \
		install -d "$${_dir}" $$(echo $$_dir|sed s'|DarK|$(PREFIX)/share/icons/DarK|');\
	done;
	for _file in $$(find DarK -type f -not -type d -not -type l); do \
		install -D "$${_file}" $$(echo $$_file|sed s'|DarK|$(PREFIX)/share/icons/DarK|');\
	done;
	for _link in $$(find DarK -type l); do \
		cp -P "$${_link}" $$(echo $$_link|sed s'|DarK|$(PREFIX)/share/icons/DarK|') ;\
	done;

installextras:
#linked themes to keep the colorscript intact
	install -d $(AMULEICONTHEMEDIR)
	install -d $(DOLPHINEMUICONTHEMEDIR)
	install -d $(EMOTICONSICONTHEMEDIR)
	install -d $(FILEZILLAICONTHEMEDIR)
	install -d $(GAJIMICONTHEMEDIR)
	install -d $(GIMP2ICONTHEMEDIR)
	install -d $(SCRIBUSICONTHEMEDIR)
	ln -sf $(ICONTHEMEDIR)/$(THEME)/App_themes/amule_dark/amule_dark.zip $(AMULEICONTHEMEDIR)/amule_dark.zip
	ln -sf $(ICONTHEMEDIR)/$(THEME)/App_themes/dolphinemu_dark $(DOLPHINEMUICONTHEMEDIR)/$(THEME)
	ln -sf $(ICONTHEMEDIR)/$(THEME)/App_themes/emoticon_dark $(EMOTICONSICONTHEMEDIR)/$(THEME)
	ln -sf $(ICONTHEMEDIR)/$(THEME)/App_themes/filezilla_dark $(FILEZILLAICONTHEMEDIR)/$(THEME)
	ln -sf $(ICONTHEMEDIR)/$(THEME)/App_themes/gajim_dark $(GAJIMICONTHEMEDIR)/$(THEME)
	ln -sf $(ICONTHEMEDIR)/$(THEME) $(GIMP2ICONTHEMEDIR)/$(THEME)
	ln -sf $(ICONTHEMEDIR)/$(THEME)/App_themes/scribus_dark/$(THEME) $(SCRIBUSICONTHEMEDIR)/$(THEME)
	install -D $(CURDIR)/$(THEME)/App_themes/scribus_dark/$(THEME).xml $(SCRIBUSICONTHEMEDIR)/$(THEME).xml
	install -D $(CURDIR)/99_enable_pidgin_theme_dark $(XSESSIONCONFDIR)/99_enable_pidgin_theme_dark

#full packages
deb:
	fakeroot debian/rules binary
rpm:
	chmod +x $(CURDIR)/.buildsuserpm.sh
	fakeroot sh -c $(CURDIR)/.buildsuserpm.sh
	
uninstall:
	rm -rf $(ICONTHEMEDIR)/$(THEME)
#Appthemes
uninstallextras:
	rm -f $(AMULEICONTHEMEDIR)/amule_dark.zip
	rm -rf $(DOLPHINEMUICONTHEMEDIR)/$(THEME)
	rm -rf $(EMOTICONSICONTHEMEDIR)/$(THEME)
	rm -rf $(FILEZILLAICONTHEMEDIR)/$(THEME)
	rm -rf $(GAJIMICONTHEMEDIR)/$(THEME)
	rm -rf $(GIMP2ICONTHEMEDIR)/$(THEME)
	rm -rf $(SCRIBUSICONTHEMEDIR)/$(THEME)
	rm -f $(SCRIBUSICONTHEMEDIR)/$(THEME).xml
	rm -f $(XSESSIONCONFDIR)/99_enable_pidgin_theme_dark

