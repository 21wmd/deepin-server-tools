#!/bin/bash

for i in {1..2171}

do

    line=$i'p'
    name=$(sed -n "$line" ~/list) 
    rpm -i /mnt/centos/SPackages/$name
    specs=$(ls ~/rpmbuild/SPECS/)
    mock -r deepin-15-x86_64 --buildsrpm --spec ~/SPECS/$specs  --sources ~/rpmbuild/SOURCES --resultdir=~/SPackages
    rm -rf ~/rpmbuild

done
