#!/usr/bin/env sh

set -eu

. ./src/api/terminate

exit_code=1
[ "${SPEC_ERROR_TOTAL:-}" = 0 ] &&
	exit_code=0

terminate "${exit_code}" \
	"∙ ${SPEC_NAME} - passed all tests" \
	"∙ ${SPEC_NAME} - failed ${SPEC_ERROR_TOTAL} test(s)"
