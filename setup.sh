#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

apt update
apt install git cmake autoconf automake libtool m4 -y
apt install pkg-config libconfig-dev libssl-dev -y

autoupdate

git clone https://github.com/OpenDataPlane/odp.git
cd odp
./bootstrap
mkdir build && cd build
../configure
make && make install

cd ../..

git clone https://github.com/openeventmachine/em-odp
cd em-odp
./bootstrap
mkdir build && cd build
../configure
make && make install
