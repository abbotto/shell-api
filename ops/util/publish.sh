#!/usr/bin/env sh

# set -eu

# if command -v gh >/dev/null 2>&1; then
#     os=$(uname -s)

#     if [ -n ${1:-} ]; then
#         os=${1}
#     fi

#     version=$(awk -F '"' '{print $2}' < src/__init__.py)

#     gh release create "${version}"
# else
#     printf '%s\n' "> The 'gh' application isn't installed | https://github.com/cli/cli"
# fi
