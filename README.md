dotfiles
========

Simple dotfiles management.

Installing
----------

Just clone this repository, put your dotfiles and -folders into ./files (without leading dots) and run ./dotfiles.sh -i to create symlinks. Paths are resolved intelligently, e.g.: if you only want to manage a single file in ~/.config/, let's say vlcrc:

```
$ ls ~/.config/vlc
vlc-qt-interface.conf  vlcrc

$ mkdir -p ~/.dotfiles/files/config/vlc
$ mv ~/.config/vlc/vlcrc ~/.dotfiles/files/config/vlc
$ .dotfiles/dotfiles.sh -i
Installing links ...
Linking /home/pi/.config/vlc/vlcrc

$ ls -l ~/.config/vlc
total 4
-rw-rw-r-- 1 pi pi 56 Aug 28 14:02 vlc-qt-interface.conf
lrwxrwxrwx 1 pi pi 41 Aug 28 14:00 vlcrc -> /home/pi/.dotfiles/files/config/vlc/vlcrc
```

If ~/.config/vlc does not exist, dotfiles.sh will create a link to the directory instead.

Uninstalling
------------

If you wish to remove your links again, just run ./dotfiles -u. This will remove all symlinks that point to files/directories contained in your *files* directory.
