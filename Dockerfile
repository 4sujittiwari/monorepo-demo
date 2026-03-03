# Multi-stage Dockerfile for Spring Boot Gradle Monorepo
FROM eclipse-temurin:17-jdk-jammy AS build
WORKDIR /app

# Copy gradle files
COPY gradlew .
COPY gradle gradle
COPY settings.gradle .
COPY build.gradle .
COPY gradle.properties .
COPY gradle/libs.versions.toml gradle/

# Copy all projects
COPY libraries libraries
COPY services services

# Build the specific service
ARG SERVICE_NAME
RUN ./gradlew :services:${SERVICE_NAME}:bootJar --no-daemon

# Final image
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
ARG SERVICE_NAME
COPY --from=build /app/services/${SERVICE_NAME}/build/libs/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
