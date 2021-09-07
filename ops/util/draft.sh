#!/usr/bin/env sh

set -eu

if command -v gh >/dev/null 2>&1; then
	version=$(awk -F '"' '{print $2}' <src/__init__.py)

	# status=$(curl -sSL -D - "github.com/${APP_REPO}/releases/tag/${version}" -o /dev/null | grep 'status:')
	# if [ "${status}" = "status: 404 Not Found" ]; then

	post_data() {
		cat <<EOF
{
  "tag_name": "${version}",
  "name": "${version}",
  "body": "",
  "draft": true,
  "prerelease": false
}
EOF
	}

	release_id=$(
		curl \
			-X POST \
			-H "Accept: application/vnd.github.v3+json" \
			"https://api.github.com/repos/${APP_REPO}/releases?access_token=${GITHUB_TOKEN}" \
			-d "$(post_data)" |
			jq ".id"
	)

	. ops/util/upload.sh
	upload_release_asset "${release_id}" "CHANGELOG.md"
	upload_release_asset "${release_id}" "LICENSE"
else
	printf '%s\n' "> The 'gh' application isn't installed | https://github.com/cli/cli"
	exit 127
fi
