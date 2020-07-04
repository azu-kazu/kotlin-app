FROM openjdk:8-jre-alpine

RUN apk update && \
    apk add --virtual=build-dependencies build-base bash curl tzdata && \
        cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

COPY ./build/libs/kotlin-app-0.0.1-SNAPSHOT.jar /usr/local/app/kotlin-app.jar

ENV TZ="Asia/Tokyo"

EXPOSE 8080 5005
