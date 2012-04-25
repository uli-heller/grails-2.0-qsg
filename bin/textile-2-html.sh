#!/bin/sh

BN="$(basename "$0")"
D="$(dirname "$0")"
D="$(cd "${D}"; pwd)"
DD="$(dirname "${D}")"

. "${D}/prepare.sh"

WIKITEXT_BASENAME=wikitext-standalone
WIKITEXT_VERSION=1.6.0.I20120123-2351

if [ ! -s "${JAR}/org.eclipse.mylyn.wikitext.core.jar" ]; then
  unzip -q -d tmp "${DD}/3rd-party/${WIKITEXT_BASENAME}-${WIKITEXT_VERSION}.zip"

  mv "${DD}/tmp/${WIKITEXT_BASENAME}"*/*.jar "${DD}/jar/."
  rm -rf "${DD}/tmp/${WIKITEXT_BASENAME}"*

  for j in "${DD}/jar/"org*wikitext*_${WIKITEXT_VERSION}.jar; do
    n="$(echo "${j}"|sed "s,_${WIKITEXT_VERSION},,")"
    mv "${j}" "${n}"
  done
fi

cat >"${DD}/bwtf.xml~" <<'EOF'
<?xml version = '1.0' encoding = 'UTF-8'?>
<!DOCTYPE project>
<project name="ipl-pcna-wikitext-formatter" default="generate-html">
    <property name="wikitext.standalone" value="jar" />
    <property name="fop.home" value="tmp/fop"/>
    <condition property="fop.extension" value=".bat">
       <os family="windows"/>
    </condition>
    <property name="fop.executable" value="${fop.home}/fop${fop.extension}" />

    <path id="wikitext.classpath">
      <fileset dir="${wikitext.standalone}">
        <include name="org.eclipse.mylyn.wikitext.*core*.jar" />
      </fileset>
    </path>
    <taskdef classpathref="wikitext.classpath" resource="org/eclipse/mylyn/wikitext/core/util/anttask/tasks.properties" />
    <target name="generate-help" description="Generate Eclipse help from textile source">
      <wikitext-to-eclipse-help markupLanguage="Textile" multipleOutputFiles="true" navigationImages="true" helpPrefix="help">
        <fileset dir="${basedir}">
          <include name="doc/*.textile" />
        </fileset>
        <stylesheet url="styles/help.css" />
        <stylesheet url="styles/main.css" />
      </wikitext-to-eclipse-help>
    </target>

    <target name="generate-html" description="Generate html from textile source">
      <copy todir="doc/html">
        <fileset dir="doc">
          <include name="*.textile" />
        </fileset>
      </copy>
      <wikitext-to-html markupLanguage="Textile">
        <fileset dir="${basedir}">
          <include name="doc/html/*.textile" />
        </fileset>
        <stylesheet url="styles/main.css" />
      </wikitext-to-html>
    </target>

    <target name="generate-pdf" description="Generate pdf from textile source">
      <wikitext-to-xslfo markupLanguage="Textile">
        <fileset dir="${basedir}">
          <include name="doc/*.textile" />
        </fileset>
      </wikitext-to-xslfo>
      <property name="fop.home" value="tmp/fop"/>
      <apply executable="${fop.executable}">
        <fileset dir="${basedir}">
          <include name="doc/*.fo" />
        </fileset>
        <mapper type="glob" from="*.fo" to="*.pdf"/>
        <srcfile/>
        <targetfile/>
      </apply>
      <mkdir dir="doc/pdf"/>
      <move todir="doc/pdf">
        <fileset dir="doc">
          <include name="*.pdf" />
        </fileset>
      </move>
    </target>
</project>
EOF

"${DD}/bin/ant.sh" -f "${DD}/bwtf.xml~" generate-html
