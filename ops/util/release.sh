#!/usr/bin/env sh

set -eu

if [ -n "${CI:-}" ]; then
	os=$(uname -s | tr '[:upper:]' '[:lower:]')
	version=$(awk -F '"' '{print $2}' <src/__init__.py)
	release_asset="dist/release-${version}-${os}.tar.gz"

	if command -v jq >/dev/null 2>&1; then
		release_id=$(curl "https://api.github.com/repos/${APP_REPO}/releases?access_token=${GITHUB_TOKEN}" | jq -r '.[0].id')

		curl \
			-X POST \
			--data-binary @"${release_asset}" \
			-H "Authorization: token ${GITHUB_TOKEN}" \
			-H "Content-Type: application/octet-stream" \
			"https://uploads.github.com/repos/${APP_REPO}/releases/${release_id}/assets?name=$(basename "${release_asset}")"
	else
		printf '%s\n' "> 'jq' not found - https://stedolan.github.io/jq/"
	fi
fi
