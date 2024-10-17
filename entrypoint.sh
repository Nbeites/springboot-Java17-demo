#!/bin/sh

# Echo the starting of the application
echo "Starting ${APP_NAME} with options: ${JAVA_OPTS}"

# Run the Java application with any provided Java options
exec java ${JAVA_OPTS} -jar /app/app.war