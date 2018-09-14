# shell-api

[![Build Status](https://travis-ci.org/abbotto/shell-api.svg?branch=master)](https://travis-ci.org/abbotto/shell-api)
[![NPM version](https://badge.fury.io/js/shell-api.svg)](http://badge.fury.io/js/shell-api)
[![GitHub version](https://badge.fury.io/gh/abbotto%2Fshell-api.svg)](https://badge.fury.io/gh/abbotto%2Fshell-api)

## Overview

A [POSIX-compliant](http://pubs.opengroup.org/onlinepubs/9699919799/) framework for shell scripts.

### Shell support

The goal is to provide a simple API that is compatible with Bourne-like shells on *nix systems.

All functions have been tested in `bash`, `dash`, `ksh`, and `zsh`.

### The API
- [confirm](doc/api.md#confirm)
- [export-file](doc/api.md#export-file)
- [join-file](doc/api.md#join-file)
- [pipe-file](doc/api.md#pipe-file)
- [print-text](doc/api.md#print-text)
- [read-file](doc/api.md#read-file)
- [require](doc/api.md#require)
- [start-daemon](doc/api.md#start-daemon)
- [stop-daemon](doc/api.md#stop-daemon)
- [strict-mode](doc/api.md#strict-mode)
- [terminate](doc/api.md#terminate)
- [watch-daemon](doc/api.md#watch-daemon)
- [write-file](doc/api.md#write-file)

---

## Getting started

### Install

- Install this project via `npm`.

      npm i shell-api --save

- Symlink the `shell` directory within a project.

      ln -s ./node_modules/shell-api/shell ./.shell

### Usage

**Method A**

    #!/usr/bin/env sh

    SCRIPT_PATH=$(cd "$(dirname "${0}")"; pwd)
    SHELL_API_PATH="${SCRIPT_PATH}/../.shell"

    # Load the whole framework at once
    . "${SHELL_API_PATH}"/shell-api

    export-file ./.env
    require <SCRIPT>

    ...

**Method B**

    #!/usr/bin/env sh

    SCRIPT_PATH=$(cd "$(dirname "${0}")"; pwd)
    SHELL_API_PATH="${SCRIPT_PATH}/../.shell"

    # Selectively load parts of the framework
    . "${SHELL_API_PATH}"/strict-mode
    . "${SHELL_API_PATH}"/export-file
    . "${SHELL_API_PATH}"/require

    export-file ./.env
    require <SCRIPT>

    ...
