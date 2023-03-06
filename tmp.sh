#!/usr/bin/env bash

# https://sharats.me/posts/shell-script-best-practices/
# Mon Mar  6 07:06:00 AM EET 2023

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
  set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
  echo 'Usage: ./script.sh arg-one arg-two

This is an awesome bash script to make your life better.

'
  exit
fi

cd "$(dirname "$0")"

main() {
  echo do awesome stuff
}

main "$@"
