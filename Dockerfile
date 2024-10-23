# Base image
FROM openjdk:17-jdk-alpine

# Add Maintainer Label
LABEL maintainer="nm.beites@gmail.com"

# Argument for the application name (passed during build time)


#This is overriden by the configuration in jenkins
ARG APP_NAME=springboot-demo

# Set the environment variables for the application
# (can be overridden at runtime)
ENV APP_NAME=${APP_NAME}
ENV JAVA_OPTS=""

# Set the working directory inside the container
WORKDIR /app

# Copy the .war file into the container
COPY target/${APP_NAME}.war /app/app.war

# Copy the entrypoint script
COPY entrypoint.sh /app/entrypoint.sh

# Make entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Expose the application port
EXPOSE 8080

# Use entrypoint.sh as the entry point
ENTRYPOINT ["/app/entrypoint.sh"]