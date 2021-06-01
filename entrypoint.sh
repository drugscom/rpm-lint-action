#!/bin/sh
set -o errexit -o pipefail

while [ -n  "${1}" ]; do
  case "${1}" in
    -*)
      RPMLINT_ARGS="${RPMLINT_ARGS} ${1}"
      shift
      ;;
    *)
      break
      ;;
  esac
done

IFS=' ,'
for TARGET in $*; do
  RPMLINT_RCFILE=$(dirname $(dirname "${TARGET}"))/.rpmlintrc

  /usr/bin/rpmlint --file "${RPMLINT_RCFILE}" ${RPMLINT_ARGS} "${TARGET}"
done
