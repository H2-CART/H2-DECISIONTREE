#!/bin/sh
if [ -z "$JAVA_HOME" ] ; then
  if [ -d "/System/Library/Frameworks/JavaVM.framework/Home" ] ; then
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
  else
    echo "Error: JAVA_HOME is not defined."
  fi
fi
if [ "$1" = "clean" ] ; then rm -rf temp bin ; fi
if [ ! -d "temp" ] ; then mkdir temp ; fi
if [ ! -d "bin" ] ; then mkdir bin ; fi
"/usr/bin/javac" -sourcepath src/tools -d bin src/tools/org/h2/build/*.java
"/usr/bin/java" -Xmx256m -cp "bin:usr/lib/jvm/java-8-oracle/lib/tools.jar:temp" org.h2.build.Build $@
