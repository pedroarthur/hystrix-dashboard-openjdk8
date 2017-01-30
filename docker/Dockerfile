FROM debian:jessie

ENV APP_HOME /opt/hystrix-dashboard

RUN echo 'deb http://ftp.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/backports.list
RUN apt-get update \
    && apt-get install -y openjdk-8-jre-headless \
    && mkdir -p "$APP_HOME"

COPY standalone-hystrix-dashboard.jar $APP_HOME/standalone-hystrix-dashboard.jar

ENTRYPOINT exec java $JVM_ARGS -jar $APP_HOME/standalone-hystrix-dashboard.jar $APP_ARGS

