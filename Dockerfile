# syntax=docker/dockerfile:1.5

# Variables de plataforma (opcionales, útiles para buildx)
ARG TARGETPLATFORM
ARG BUILDPLATFORM

# Etapa de build
FROM --platform=$BUILDPLATFORM gradle:7.5.1-jdk17-alpine AS builder

WORKDIR /app
COPY build.gradle .
COPY settings.gradle .
COPY gradle/ gradle/
COPY src src

# Build (sin tests)
RUN gradle build -x test

# Etapa de runtime (JRE más liviano)
FROM --platform=$TARGETPLATFORM eclipse-temurin:17-jre-alpine AS runtime

WORKDIR /app
COPY --from=builder /app/build/libs/config-server-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8888
ENTRYPOINT ["java","-jar","/app/app.jar"]
