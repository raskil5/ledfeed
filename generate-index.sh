#!/bin/sh
cd "$(dirname "$0")"
echo "src-git ledfeed https://github.com/raskil5/ledfeed.git" > feeds.conf
echo "Package: s12-pro-signald" > Packages
echo "Version: 1.0-1" >> Packages
echo "Depends: sms-tool" >> Packages
echo "Section: utils" >> Packages
echo "Source: ledfeed" >> Packages
gzip -c Packages > Packages.gz
