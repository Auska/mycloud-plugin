#!/bin/sh

path=$1

#restore original config if upgeade.
[ -f /usr/gitconfig ] && mv -f /usr/gitconfig $path/etc/gitconfig
#remove link
rm -rf /usr/local/bin/git 2> /dev/null
rm -rf /usr/local/bin/git-cvsserver 2> /dev/null
rm -rf /usr/local/bin/git-receive-pack 2> /dev/null
rm -rf /usr/local/bin/gitk 2> /dev/null
rm -rf /usr/local/bin/git-shell 2> /dev/null
rm -rf /usr/local/bin/git-upload-archive 2> /dev/null
rm -rf /usr/local/bin/git-upload-pack 2> /dev/null
rm -rf /bin/git 2> /dev/null
rm -rf /bin/git-cvsserver 2> /dev/null
rm -rf /bin/git-receive-pack 2> /dev/null
rm -rf /bin/gitk 2> /dev/null
rm -rf /bin/git-shell 2> /dev/null
rm -rf /bin/git-upload-archive 2> /dev/null
rm -rf /bin/git-upload-pack 2> /dev/null
rm -rf /usr/local/etc/gitconfig 2> /dev/null
rm -rf /usr/local/lib/libz.so.1 2> /dev/null
rm -rf /usr/local/lib/libcharset.so.1 2> /dev/null
rm -rf /usr/local/libexec/git-core 2> /dev/null
rm -rf /usr/local/share/git-core 2> /dev/null
rm -rf /usr/local/share/git-gui 2> /dev/null
rm -rf /usr/local/share/gitk 2> /dev/null
rm -rf /usr/local/share/gitweb 2> /dev/null
rm -rf /var/www/git 2> /dev/null

#create link
mkdir /var/www/git
ln -s $path/git.png /var/www/git/git.png
#ln -s $path/desc.xml /var/www/git/desc.xml