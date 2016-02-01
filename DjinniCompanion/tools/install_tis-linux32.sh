#!/bin/sh
cd DjinniCompanion/areas || cd djinnicompanion/areas
chmod +x ../tools/linux/x86/tileconv
../tools/linux/x86/tileconv -o ../../override *.tbc
