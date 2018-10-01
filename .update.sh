#!/bin/sh
set -e
_basedir="$(dirname "$(readlink -f "${0}")")"
cd "$_basedir"
#rm -rf .git
#git init
LANG=C
MESSAGE="$(date -u '+%Y.%m.%d.%H%M%S')"
cp -f debian/changelog_template debian/changelog
sed -i s'/__COMMIT__/'$MESSAGE'/g' debian/changelog
cp -f .buildsuserpm.sh.template .buildsuserpm.sh
sed -i s'/__COMMIT__/'$MESSAGE'/g' .buildsuserpm.sh
git add .
git commit -m "$MESSAGE"
#git remote add origin http://gitlab.com/sixsixfive/dark.git
#git push -u --force origin master
git push origin master
printf "\n...done\n"
exit 0
