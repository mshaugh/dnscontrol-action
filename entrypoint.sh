#!/usr/bin/env bash

set -o pipefail

# Resolve files to absolute paths
CONFIG_ABS_PATH="$(readlink -f "${INPUT_CONFIG_FILE}")"
CREDS_ABS_PATH="$(readlink -f "${INPUT_CREDS_FILE}")"

WORKING_DIR="$(dirname "${CONFIG_ABS_PATH}")"
cd "$WORKING_DIR" || exit

ARGS=(
	"$@"
	--config "$CONFIG_ABS_PATH"
)

# `check` subcommand doesn't require credentials
if [ "$1" != "check" ]; then
	ARGS+=(--creds "$CREDS_ABS_PATH")
fi

IFS=
OUTPUT="$(dnscontrol "${ARGS[@]}")"
EXIT_CODE="$?"

echo "$OUTPUT"

# Filter output to reduce 'preview' PR comment length
FILTERED_OUTPUT="$(echo "$OUTPUT" |
	grep -v -e '^\.\.\.0 corrections$' |
	grep -v -e '^0 corrections' |
	grep -v -e '\.\.\. (skipping)' |
	grep -v -e '^----- DNS Provider: ' |
	grep -v -e '^----- Registrar: ' |
	grep -v -e '^----- Getting nameservers from:' |
	grep -v -e '^CONCURRENTLY' |
	grep -v -e '^Waiting for concurrent' |
	grep -v -e '^SERIALLY' |
	grep -v -e '^Serially Gathering:' |
	sed -e 's/\x1b\[[0-9;]*m//g')"

# Set output
# https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions#multiline-strings
DELIMITER="DNSCONTROL-$RANDOM"

{
	echo "output<<$DELIMITER"
	echo "$OUTPUT"
	echo "$DELIMITER"

	echo "preview_comment<<$DELIMITER"
	echo "$FILTERED_OUTPUT"
	echo "$DELIMITER"
} >>"$GITHUB_OUTPUT"

exit $EXIT_CODE
