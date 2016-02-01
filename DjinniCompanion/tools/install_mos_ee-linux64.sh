#!/bin/sh
cd DjinniCompanion/areas/bg2ee || cd djinnicompanion/areas/bg2ee
chmod +x ../../tools/linux/x86_64/tileconv
../../tools/linux/x86_64/tileconv -o ../../../override *.mbc
