#!/bin/bash

LIBFASTCOMMON_VERSION="1.0.48"
FDFS_VERSION="6.07"


wget -O /tmp/libfastcommon-${LIBFASTCOMMON_VERSION}.tar.gz https://github.com/happyfish100/libfastcommon/archive/V${LIBFASTCOMMON_VERSION}.tar.gz
wget -O /tmp/fastdfs-${FDFS_VERSION}.tar.gz https://github.com/happyfish100/fastdfs/archive/V${FDFS_VERSION}.tar.gz


tar zvxf /tmp/libfastcommon-${LIBFASTCOMMON_VERSION}.tar.gz -C /tmp/

pushd /tmp/libfastcommon-${LIBFASTCOMMON_VERSION} > /dev/null || exit 1
./make.sh && sudo ./make.sh install
popd > /dev/null || exit 1


tar zvxf /tmp/fastdfs-${FDFS_VERSION}.tar.gz -C /tmp/

pushd /tmp/fastdfs-${FDFS_VERSION} > /dev/null || exit 1
./make.sh && sudo ./make.sh install
sudo cp /etc/fdfs/tracker.conf.sample /etc/fdfs/tracker.conf
sudo cp /etc/fdfs/storage.conf.sample /etc/fdfs/storage.conf
popd > /dev/null || exit 1


rm -rf /tmp/libfastcommon-*
rm -rf /tmp/fastdfs-*
