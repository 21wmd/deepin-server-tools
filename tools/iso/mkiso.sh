#!/bin/bash

cpiso () {
    sudo mount -o loop $ISO_PATH /mnt
    rsync -a --exclude=Packages/ --exclude=repodata/ /mnt/ $dvdiso/
    mkdir -p $dvdiso/{Packages,repodata}
}

mkiso () {

    if [`rpm-qa | grep genisoimage | wc -l` -ne 0 ]; then
        mkisofs -o $isodir/Deepin-15_64-$date.iso -b $dvdiso/isolinux/isolinux.bin -c $dvdiso/isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -R -J -v -T ./$dvdiso/
    else
        echo "Please execute isoinit script"
    fi

}
