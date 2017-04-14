#!/bin/bash

init () {
    directory=$(cd .. ; pwd)

    mkdir -p $directory/archive/{iso,rpm,src,dvdiso}

    isodir=$directory/archive/iso/
    rpmdir=$directory/archive/rpm/
    srcdir=$directory/archive/src/
    dvdiso=$directory/archive/dvdiso/

    isodate=$(date +%Y_%m_%d_%R)

    sudo rpm -i $directory/server-tools/etc/epel-release-latest-6.noarch.rpm
    sudo yum clean all
    sudo yum makecache

}

isoinit () {
    sudo yum install anaconda repodata createrepo mkisofs rsync
}

rpminit () {
    sudo yum install rpmdevtools mock -y
    sudo cp ./etc/deepin-15-x86_64.cfg /etc/mock/
}
