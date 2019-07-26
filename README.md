# shell-api

[![Build Status](https://travis-ci.org/abbotto/shell-api.svg?branch=master)](https://travis-ci.org/abbotto/shell-api)
[![NPM version](https://badge.fury.io/js/shell-api.svg)](http://badge.fury.io/js/shell-api)
[![GitHub version](https://badge.fury.io/gh/abbotto%2Fshell-api.svg)](https://badge.fury.io/gh/abbotto%2Fshell-api)

## Overview

A robust set of [POSIX-compliant](http://pubs.opengroup.org/onlinepubs/9699919799/) scripts for shell environments.

### Shell support

The goal is to provide a simple API that is compatible with Bourne-like shells on *nix systems.

All functions have been tested in `bash`, `dash`, `fish`, `ksh`, and `zsh`.

### The API
- [confirm](doc/api.md#confirm)
- [export-file](doc/api.md#export-file)
- [join-file](doc/api.md#join-file)
- [pipe-file](doc/api.md#pipe-file)
- [print-text](doc/api.md#print-text)
- [read-file](doc/api.md#read-file)
- [require](doc/api.md#require)
- [substring](doc/api.md#substring)
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

### Usage

**Method A**

    #!/usr/bin/env sh

    SHELL_API_PATH="/path/to/shell-api/shell"

    export SHELL_API_PATH

    # Load all the scripts at once
    . "${SHELL_API_PATH}"/shell-api

    export-file ./.env
    require <SCRIPT>

    ...

**Method B**

    #!/usr/bin/env sh

    SHELL_API_PATH="/path/to/shell-api/shell"

    export SHELL_API_PATH

    # Selectively load scripts
    . "${SHELL_API_PATH}"/strict-mode
    . "${SHELL_API_PATH}"/export-file
    . "${SHELL_API_PATH}"/require

    export-file ./.env
    require <SCRIPT>

    ...
