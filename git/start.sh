#!/bin/sh
path=/mnt/HD/HD_a2/Nas_Prog/git
#create link
ln -sf $path/bin/git /usr/local/bin/git
ln -sf $path/bin/git-cvsserver /usr/local/bin/git-cvsserver
ln -sf $path/bin/git-receive-pack /usr/local/bin/git-receive-pack
ln -sf $path/bin/gitk /usr/local/bin/gitk
ln -sf $path/bin/git-shell /usr/local/bin/git-shell
ln -sf $path/bin/git-upload-archive /usr/local/bin/git-upload-archive
ln -sf $path/bin/git-upload-pack /usr/local/bin/git-upload-pack
ln -sf $path/bin/git /bin/git
ln -sf $path/bin/git-cvsserver /bin/git-cvsserver
ln -sf $path/bin/git-receive-pack /bin/git-receive-pack
ln -sf $path/bin/gitk /bin/gitk
ln -sf $path/bin/git-shell /bin/git-shell
ln -sf $path/bin/git-upload-archive /bin/git-upload-archive
ln -sf $path/bin/git-upload-pack /bin/git-upload-pack
[ -d /usr/local/etc ] || mkdir /usr/local/etc
[ -d /usr/local/lib ] || mkdir /usr/local/lib
[ -d /usr/local/libexec ] || mkdir /usr/local/libexec
[ -d /usr/local/share ] || mkdir /usr/local/share
[ -d /usr/local/include ] || mkdir /usr/local/include
[ -d /usr/local/lib/pkgconfig ] || mkdir /usr/local/lib/pkgconfig
ln -sf $path/etc/gitconfig /usr/local/etc/gitconfig
ln -sf $path/lib/libz.so.1.2.8 /usr/local/lib/libz.so.1
ln -sf $path/lib/libcharset.so.1.0.0 /usr/local/lib/libcharset.so.1
ln -sf $path/libexec/git-core /usr/local/libexec/git-core
ln -sf $path/share/git-core /usr/local/share/git-core
ln -sf $path/share/git-gui /usr/local/share/git-gui
ln -sf $path/share/gitk /usr/local/share/gitk
ln -sf $path/share/gitweb /usr/local/share/gitweb

#set permissions
chmod 755 $path/bin/git /usr/local/bin/git
chmod 755 $path/bin/git-receive-pack /usr/local/bin/git-receive-pack
chmod 755 $path/bin/gitk /usr/local/bin/gitk
chmod 755 $path/bin/git-cvsserver /usr/local/bin/git-cvsserver
chmod 755 $path/bin/git-shell /usr/local/bin/git-shell
chmod 755 $path/bin/git-upload-archive /usr/local/bin/git-upload-archive
chmod 755 $path/bin/git-upload-pack /usr/local/bin/git-upload-pack