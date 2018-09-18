#!/bin/sh

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

#download new versions
mkdir -pv downloads
cd downloads
rm -rvf *.zip
wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$1.zip
cd -

./build-rpm.sh $1
./build-deb.sh $1
