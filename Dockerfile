FROM debian:bullseye-slim

MAINTAINER Niels Højen <niels@hojen.net>

HAZEL_VERSION = "1.0.2"

RUN apt update
RUN apt upgrade -y
RUN apt install curl libpq libldap2
RUN mkdir /downloads
RUN curl https://github.com/MPIB/hazel/releases/download/v${HAZEL_VERSION}/hazel_${HAZEL_VERSION}_amd64.deb -o /downloads/hazel_${HAZEL_VERSION}_amd64.deb
RUN dpkg -i /downloads/hazel_1.0.2_amd64.d
RUN rm -rf /downloads

ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 80

CMD /run.sh
