#!/usr/bin/env bash

sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get purge -y lxc-docker*
sudo apt-get install -y openjdk-7-jdk
sudo apt-get install -y autoconf libtool
sudo apt-get -y install build-essential python-dev python-boto libcurl4-nss-dev libsasl2-dev maven libapr1-dev libsvn-dev libevent-dev linux-tools-common docker-engine

mkdir src
cd src
git clone https://git-wip-us.apache.org/repos/asf/mesos.git

cd mesos
mkdir build
./bootstrap
cd build
../configure --enable-libevent --enable-ssl --prefix="$HOME/local"

