#!/bin/bash
set -x
set -e

rm -rf tmp
fakeroot sh -c 'dpkg-deb -R deb/mosquitto_1.4.14-0mosquitto1~jessie1_armhf.deb tmp'
rm -rf tmp/lib/systemd/system/mosquitto.service
cp src/DEBIAN/control tmp/DEBIAN

fakeroot sh -c 'dpkg-deb -b tmp mosquitto_1.4.14-0mosquitto1~jessie1+moxa_armhf.deb'

