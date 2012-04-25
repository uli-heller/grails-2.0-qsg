#!/bin/sh
#

D="$(dirname "$0")"
D="$(cd "${D}"; pwd)"
DD="$(dirname "${D}")"

. "${DD}/bin/prepare.sh"

ANT_DIR="${GRAILS_HOME}/lib/org.apache.ant"
JAVA_HOME=/usr/lib/jvm/default-java
export JAVA_HOME

CP=
for j in $(find "${ANT_DIR}" -name "*.jar"); do
  CP="${CP}:${j}"
done

exec ${JAVA_HOME}/bin/java -cp "${CP}" org.apache.tools.ant.launch.Launcher "$@"

