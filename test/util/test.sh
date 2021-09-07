#!/usr/bin/env sh

set -eu

./dev/util/build.sh

platform=$(uname -s | tr '[:upper:]' '[:lower:]')

mkdir -p './test/tmp'
cp -r './test/spec/.' './test/tmp/spec'
cp -r './build/shell-api' './test/tmp'

shells=ash,bash,dash,ksh,mksh,yash,zsh

INIT_MESSAGE() {
	printf '%s\n' "∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙"
	printf '%s\n' "∙ START $(command -v "${SHELL_API_ENV:-}")"
	printf '%s' '∙'
}

EXIT_MESSAGE() {
	if [ "${1:-}" != 0 ]; then
		printf '%s\n' '∙'
		printf '%s\n' "∙ END $(command -v "${SHELL_API_ENV:-}"): failed"
		printf '%s\n' '∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙ ∙'
		exit 1
	fi
}

# Loop over each shell name and runn the tests for a given shell
for SHELL_API_ENV in $(printf '%s' "${shells}" | sed "s/,/ /g"); do
	export SHELL_API_ENV

	# Set the shebang header in each script
	find './test/tmp' -type f | while read -r file; do
		pattern='\(a\|ba\|da\|k\|mk\|ya\|z\|\)sh'
		sed_prefix="sed -i"

		if [ "${platform}" = 'darwin' ]; then
			sed_prefix="${sed_prefix} '' -e"
		fi

		eval "${sed_prefix} 's@env ${pattern}@env ${SHELL_API_ENV:-sh}@g' '${file}'"
	done

	# Skip to the next shell if the shell isn't found
	if ! command -v "${SHELL_API_ENV:-}" >/dev/null 2>&1; then
		printf "\nWARN: %s\n" "Unrecognizd shell (${SHELL_API_ENV:-}), skipping..."
		continue
	fi

	INIT_MESSAGE

	# shellcheck disable=SC2016
	"$(command -v "${SHELL_API_ENV:-}")" -c '
	current_shell="unknown"

	# Try to detect the current shell
	if [ -n "${ZSH_VERSION}" ]; then
		current_shell="zsh"
	elif [ -n "${YASH_VERSION}" ]; then
		current_shell="yash"
	elif [ -n "${BASH_VERSION}" ]; then
		current_shell="bash"
	else
		name="$(ps -p $$ -ocomm=)"
		current_shell="$(basename "${name%.*}")"
	fi

	if [ "${current_shell}" = '"${SHELL_API_ENV}"' ]; then
		. ./test/tmp/spec/shell-api.test
	else
		printf "\nERROR: %s\n" "Unrecognizd shell (${current_shell})"
		exit 1
	fi'

	EXIT_MESSAGE "${?}"
done

trap "rm -rf ./test/tmp" EXIT INT HUP TERM
