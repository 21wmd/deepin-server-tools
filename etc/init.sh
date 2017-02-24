#!/bin/sh

init () {
    directory=$(cd .. ; pwd)

    mkdir -p $directory/archive/{iso,rpm,src,dvdiso}

    isodir=$directory/archive/iso/
    rpmdir=$directory/archive/rpm/
    srcdir=$directory/archive/src/
    dvdiso=$directory/archive/dvdiso/

    isodate=$(date +%Y_%m_%d_%R)
}

isoinit () {
    sudo yum install anaconda repodata createrepo mkisofs rsync
}

rpminit () {
    sudo yum install rpmdevtools mock
    sudo cp ./etc/deepin-15-x86_64.cfg /etc/mock/
}
