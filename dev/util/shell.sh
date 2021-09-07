#!/usr/bin/env sh

set -eu

platform=$(uname -s | tr '[:upper:]' '[:lower:]')
pattern='\(a\|ba\|da\|k\|mk\|ya\|z\|\)sh'
sed_prefix="sed -i"

if [ "${platform}" = 'darwin' ]; then
	sed_prefix="${sed_prefix} '' -e"
fi

find './api' -type f | while read -r file; do
	eval "${sed_prefix} 's@env ${pattern}@env ${SHELL_API_ENV:-sh}@g' '${file}'"
done
