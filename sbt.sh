#!/bin/bash

# SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
# exec java $SBT_OPTS -jar `dirname $0`/sbt-launch.jar "$@"
exec sbt "run-main org.clulab.reach.export.server.FileProcessorWebUI"