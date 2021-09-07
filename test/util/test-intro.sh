#!/usr/bin/env sh

set -eu

. ./src/api/print-text

print_text 15 '\n%s\n' "∙ ${SPEC_NAME} - running '${SHELL_API_ENV}' tests..."
