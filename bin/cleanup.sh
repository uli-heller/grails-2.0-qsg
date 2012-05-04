#!/bin/sh
#

D="$(dirname "$0")"
D="$(cd "${D}"; pwd)"
DD="$(dirname "${D}")"

for d in unpacked tmp jar doc/html; do
  rm -rf "${DD}/${d}"
done

find "${DD}" -name "*~" -print0 | xargs -0 rm -f
find "${DD}" -name "stacktrace.log" -print0 | xargs -0 rm -f

rm -rf playground/Playground/.classpath  playground/Playground/.project  playground/Playground/.settings
