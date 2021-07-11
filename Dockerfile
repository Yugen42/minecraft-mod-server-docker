FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y full-upgrade
RUN apt-get -y install default-jre jq curl

COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT /opt/entrypoint.sh
