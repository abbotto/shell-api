#!/usr/bin/env sh

set -eu

platform=$(uname -s | tr '[:upper:]' '[:lower:]')

if [ "${platform}" = 'linux' ]; then
	sudo apt-add-repository \
		"deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse"
	sudo apt-get -qq update
	sudo apt-get install shellcheck xz-utils ash bash dash ksh93 mksh yash zsh
elif [ "${platform}" = 'darwin' ]; then
	if command -v brew >/dev/null 2>&1; then
		brew install shellcheck bash ksh mksh yash
	else
		printf '%s\n' "> 'homebrew' not found - https://brew.sh/"
		exit 127
	fi
fi
