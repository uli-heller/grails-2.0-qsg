#!/bin/sh
#

D="$(dirname "$0")"
D="$(cd "${D}"; pwd)"
DD="$(dirname "${D}")"

for d in unpacked tmp jar doc/html; do
  rm -rf "${DD}/${d}"
done

find "${DD}" -name "*~" -print0 | xargs -0 rm -f
