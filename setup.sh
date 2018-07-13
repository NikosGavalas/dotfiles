#!/bin/bash

YES=
if [ "$1" = "-y" ]; then
	shift
	YES=1
fi

STEP () {
	if [ -z "$YES" ]; then
		read -p 'Do it? (Y/n) ' c
		[ -z "$c" ] || [ "$c" = "Y" ] || [ "$c" = "y" ]
	else
		true
	fi
}

set -v
cd ${HOME}

STEP Install git, vim, and other tools && {
	sudo apt install git vim bash-completion bc glances htop screen g++ gcc binutils build-essential tree
}

STEP Enable greek UTF-8 locale && {
	sed -i -e 's/^# *\(el_GR.UTF-8\)$/\1/g' /etc/locale.gen
	locale-gen
}

STEP Enable greek UTF-8 typing in shell && {
	touch ~/.bashrc
	sed -i -e '/^export LC_CTYPE=/d' ~/.bashrc
	echo 'export LC_CTYPE=el_GR.UTF-8' '>>' ~/.bashrc
}


STEP Install bashrc and vimrc && {
	mv ~/.bashrc ~/.bashrc.old || true
	mv ~/.vimrc ~/.vimrc.old || true
	cp $PWD/bashrc ~/.bashrc
	cp $PWD/vimrc ~/.vimrc
}

set +v
echo 'Done.'

