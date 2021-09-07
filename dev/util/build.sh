#!/usr/bin/env sh

set -eu

# Cleanup the previous 'build' directory
[ -d './build' ] && rm -rf './build'

# Create the 'build' directory and
# copy the required files to it
mkdir -p "./build"
cp -r doc README.md LICENSE ./build
cd ./build

# ------------------------------------------------
# Build th script header
# ------------------------------------------------

build_script() {
	awk '{if (NR!=1) {print}}' <"${1}" >>"${2}"
}

# Add the shebang
printf '%s\n\n' '#!/usr/bin/env sh' >shell-api

# Export the version
# shellcheck disable=SC2129
printf '%s\n' "SHELL_API_VERSION=$(cat ../.version)" >>shell-api
printf '%s\n\n' "export SHELL_API_VERSION" >>shell-api

# Add the license
awk '{print "# " $0}' <LICENSE >>shell-api

# Add the 'strict_mode' function
build_script ../src/api/strict-mode shell-api

# Add bugfixes and special conditions
build_script ../src/bootstrap shell-api

# shellcheck disable=SC2129
printf '\n%s\n' "################################################################" >>shell-api
printf '%s\n' "# Initialize the 'shell-api' library functions" >>shell-api
printf '%s\n' "################################################################" >>shell-api

# Add 'shell-api' library functions
find '../src/api' -type f | sort | while read -r file; do
	if [ "${file}" != "../src/api/strict-mode" ]; then
		build_script "${file}" shell-api
	fi
done

# Strip shellcheck comments
awk '!/shellcheck disable/' \
	shell-api >tmpf && mv tmpf shell-api

# Make the script executable
chmod +x shell-api

# Create the release package archive
tar -czvf "./release-$(cat ../.version).tar.gz" \
	shell-api doc README.md LICENSE >/dev/null 2>&1
