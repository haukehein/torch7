#!/bin/bash

[ -z "$( which mktemp     2> /dev/null )" ]  &&  echo "ERROR: 'mktemp' is not installed!"                &&  exit 1
[ -z "$( which git        2> /dev/null )" ]  &&  echo "ERROR: 'git' is not installed!"                   &&  exit 1
[ -z "$( which docker     2> /dev/null )" ]  &&  echo "ERROR: 'docker' is not installed!"                &&  exit 1
[ -z "$( docker --version 2> /dev/null )" ]  &&  echo "ERROR: You are not allowed to execute 'docker'!"  &&  exit 1

if [ -z "$( docker images haukehein/phusion_passenger-customizable  2> /dev/null | grep 0.9.19_update )" ]
then
	TMP=`mktemp -d`
		git clone https://github.com/haukehein/phusion_passenger-customizable.git "$TMP" --recursive  && \
		cd "$TMP"  && \
		bash ./build.sh
	cd -  
	rm -rf "$TMP"
fi

docker build $1 -t haukehein/torch7:1.0.0 .
