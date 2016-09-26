#!/bin/bash

[ -z "$( which mktemp     2> /dev/null )" ]  &&  echo "ERROR: 'mktemp' is not installed!"                &&  exit 1
[ -z "$( which git        2> /dev/null )" ]  &&  echo "ERROR: 'git' is not installed!"                   &&  exit 1
[ -z "$( which docker     2> /dev/null )" ]  &&  echo "ERROR: 'docker' is not installed!"                &&  exit 1
[ -z "$( docker --version 2> /dev/null )" ]  &&  echo "ERROR: You are not allowed to execute 'docker'!"  &&  exit 1


  BUILD=haukehein/torch7:1.0.0
  FROM=haukehein/phusion_passenger-customizable:0.9.19_update

if [ -z "$( docker images $(echo -E "$FROM" | cut -d: -f1)  2> /dev/null | grep $(echo -E "$FROM" | cut -d: -f2) )" ]
then
	TMP=`mktemp -d`
		git clone https://github.com/$(echo -E "$FROM" | cut -d: -f1).git "$TMP" --recursive  && \
		cd "$TMP"  && \
		bash ./build.sh
	cd -  
	rm -rf "$TMP"
fi

docker build $1 -t $BUILD .
