#/bin/sh
#mimetypes
if [ -d mimetypes ];then
	rm -rf mimetypes
	mkdir mimetypes
fi
for f in $(find pool -name 'application-*.svg'); do 
	ln -s $(echo $f|sed 's\^.*/\../pool/\') $(echo $f|sed 's\^.*/\mimetypes/\')
done
for f in $(find pool -name 'audio-*.svg'); do 
	ln -s $(echo $f|sed 's\^.*/\../pool/\') $(echo $f|sed 's\^.*/\mimetypes/\')
done
for f in $(find pool -name 'font-*.svg'); do 
	ln -s $(echo $f|sed 's\^.*/\../pool/\') $(echo $f|sed 's\^.*/\mimetypes/\')
done
for f in $(find pool -name 'image-*.svg'); do 
	ln -s $(echo $f|sed 's\^.*/\../pool/\') $(echo $f|sed 's\^.*/\mimetypes/\')
done
for f in $(find pool -name 'text-*.svg'); do 
	ln -s $(echo $f|sed 's\^.*/\../pool/\') $(echo $f|sed 's\^.*/\mimetypes/\')
done
for f in $(find pool -name 'video-*.svg'); do 
	ln -s $(echo $f|sed 's\^.*/\../pool/\') $(echo $f|sed 's\^.*/\mimetypes/\')
done
for f in $(find pool -name 'x-content-*.svg'); do 
	ln -s $(echo $f|sed 's\^.*/\../pool/\') $(echo $f|sed 's\^.*/\mimetypes/\')
done
for f in $(find pool -name 'x-epoch-*.svg'); do 
	ln -s $(echo $f|sed 's\^.*/\../pool/\') $(echo $f|sed 's\^.*/\mimetypes/\')
done
#filesystems
if [ -d filesystems ];then
	rm -rf filesystems
	mkdir filesystems
fi
for f in $(find pool -name 'inode-*.svg'); do 
	ln -s $(echo $f|sed 's\^.*/\../pool/\') $(echo $f|sed 's\^.*/\filesystems/\')
done
for f in $(find pool -name 'message-*.svg'); do 
	ln -s $(echo $f|sed 's\^.*/\../pool/\') $(echo $f|sed 's\^.*/\filesystems/\')
done
for f in $(find pool -name 'multipart-*.svg'); do 
	ln -s $(echo $f|sed 's\^.*/\../pool/\') $(echo $f|sed 's\^.*/\filesystems/\')
done
