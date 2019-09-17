#!/bin/sh
set -e
mkdir -p build/freerdp && cd build
curl http://security.ubuntu.com/ubuntu/pool/universe/f/freerdp/freerdp_1.1.0~git20140921.1.440916e+dfsg1.orig.tar.xz -o freerdp_1.1.2.tar.xz
cp ../freerdp.md5 .
md5sum -c freerdp.md5
cd freerdp
tar -xJf ../freerdp_1.1.2.tar.xz  --strip-components=1
ln -s ../../debian
dpkg-buildpackage -b -rfakeroot -us -uc
cd ../ && mkdir freerdppackages && mv *.deb freerdppackages
dpkg-scanpackages freerdppackages > freerdppackages/Packages
tar -cvzf freerdppackages.tar.gz freerdppackages