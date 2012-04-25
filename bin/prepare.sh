#!/bin/sh

#D="$(dirname "$0")"
#D="$(cd "${D}"; pwd)"
#DD="$(dirname "${D}")"

GRAILS_VERSION=2.0.3
# ANT: Innerhalb von Grails
ANT_VERSION=1.8.2

GRAILS_ZIP="${DD}/3rd-party/grails-${GRAILS_VERSION}.zip"

UNPACKED="${DD}/unpacked"

if [ ! -d "${UNPACKED}" ]; then
  mkdir "${UNPACKED}"
fi

GRAILS_HOME="${UNPACKED}/grails"

if [ ! -d "${GRAILS_HOME}" ]; then
  unzip -q -d "${UNPACKED}" "${GRAILS_ZIP}"
  mv "${UNPACKED}/grails-${GRAILS_VERSION}" "${GRAILS_HOME}"
fi

TMP="${DD}/tmp"
if [ ! -d "${TMP}" ]; then
  mkdir "${TMP}"
fi

JAR="${DD}/jar"
if [ ! -d "${JAR}" ]; then
  mkdir "${JAR}"
fi
