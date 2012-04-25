#!/bin/sh
#

D="$(dirname "$0")"
D="$(cd "${D}"; pwd)"
DD="$(dirname "${D}")"

. "${DD}/bin/prepare.sh"

GRAILS_HOME="${DD}/unpacked/grails"
JAVA_HOME=/usr/lib/jvm/default-java
export JAVA_HOME
#
exec ${GRAILS_HOME}/bin/grails "$@"
