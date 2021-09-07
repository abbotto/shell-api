#!/usr/bin/env sh

# set -eu

# bold=$(tput bold)
# normal=$(tput sgr0)

# if [ command -v cz >/dev/null 2>&1 ]; then
#     printf '%s\n' "${bold}> Bumping version with 'commitizen' | https://commitizen-tools.github.io/commitizen/${normal}"

#     cz bump --check-consistency

#     # shellcheck disable=SC2016
#     # cz bump "${@}"
# else
#     printf '%s\n' "${bold}> 'commitizen' not found - https://commitizen-tools.github.io/commitizen/${normal}"
# 	printf '%s\n' "${bold}> Run 'pipx install commitizen' to install it${normal}"
# fi
