#!/bin/bash
set -e
_dir=`dirname "$(readlink -f "${0}")"`
_basedir=${_dir}
cd ${_basedir}
if [ -f ${_basedir}/dark-icon-theme*.rpm ]; then
    rm -f ${_basedir}/dark-icon-theme*.rpm
fi
if [ -f ${_basedir}/dark-icon-theme.spec ]; then
    rm -f ${_basedir}/dark-icon-theme.spec
fi
if [ -d ${_basedir}/dark-icon-theme ]; then
    rm -rf ${_basedir}/dark-icon-theme
fi
mkdir -p ${_basedir}/dark-icon-theme/usr/share/icons
cp -R ${_basedir}/DarK ${_basedir}/dark-icon-theme/usr/share/icons/DarK
#cp is faster!
#make PREFIX=${_basedir}/dark-icon-theme/usr SYSCONFDIR=${_basedir}/dark-icon-theme/etc ICONTHEMEDIR=/usr/share/icons install
make PREFIX=${_basedir}/dark-icon-theme/usr XSESSIONCONFDIR=${_basedir}/dark-icon-theme/etc/X11/xinit/xinitrc.d ICONTHEMEDIR=/usr/share/icons installextras

#creating the spec file:
cat <<\EOFALL> ${_basedir}/dark-icon-theme.spec
Buildroot: BUILDROOT
Name: dark-icon-theme
Version: 20191004201712
Release: 1
Summary: Minimalism at its finest.
License: CC-BY-SA_V4
Requires: findutils, findutils, hicolor-icon-theme
Provides: dark-icon-theme = %version, gnome-icon-theme
Obsoletes: dark-icon-theme <= %version
Recommends: amule, dolphinemu, pidgin, gajim, icewm, filezilla, scribus, gimp, inkscape, mypaint, yad, kdialog, imagemagick, optipng, p7zip-full
Group: System/X11
BuildArch: noarch

%define _rpmdir ../
%define _unpackaged_files_terminate_build 0
%define _source_payload w0.gzdio
%define _binary_payload w0.gzdio
%description
Plain and simple dark theme

%post
if [ -d "/usr/share/icons/DarK/backup" ]; then
	rm -rf /usr/share/icons/DarK/backup
fi

%postun
if [ -d "/usr/share/icons/DarK/backup" ]; then
	rm -rf /usr/share/icons/DarK/backup
fi

%files
%defattr(-,root,root,-)
#%doc COPYING ReadMe.md LICENSE
%{_datadir}/*
%{_sysconfdir}/*
EOFALL

rpmbuild -bb --buildroot=${_basedir}/dark-icon-theme ${_basedir}/dark-icon-theme.spec
if [ -f ${_basedir}/../noarch/dark-icon-theme*.rpm ]; then
	mv ${_basedir}/../noarch/dark-icon-theme*.rpm ${_basedir}
	rm -rf ${_basedir}/../noarch ${_basedir}/dark-icon-theme.spec
fi
