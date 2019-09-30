#/bin/sh
#mimetypes
#for f in $(find mimetypes -name '*.svg'); do
#    if [ -f pool/$(echo $f|sed 's\^.*/\\') ]; then
#        rm -f pool/$(echo $f|sed 's\^.*/\\')
#    fi
#done
set -x
for l in $(find pool -xtype l); do
    if [ -f mimetypes/$(echo $l|sed 's\^.*/\\') ]; then
        ln -s ../mimetypes/$(readlink $l|sed 's\^.*/\\') $l
    fi
done

