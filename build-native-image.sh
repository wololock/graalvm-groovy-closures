#!/usr/bin/env bash

if [[ ! -f ./build/libs/graalvm-groovy-closures-all.jar ]]; then
    echo "Compiling Groovy source code..."
    ./gradlew shadowJar
fi

echo "Compiling GraalVM native image..."

native-image --allow-incomplete-classpath \
    -H:+AllowVMInspection \
    -H:+ReportUnsupportedElementsAtRuntime \
    -H:ConfigurationFileDirectories=config/native-image/ \
    --initialize-at-build-time \
    --initialize-at-run-time=org.codehaus.groovy.control.XStreamUtils,groovy.grape.GrapeIvy \
    --no-fallback \
    --no-server \
    -H:+ReportExceptionStackTraces \
    -jar build/libs/graalvm-groovy-closures-all.jar
