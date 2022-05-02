FROM debian:bullseye-slim

MAINTAINER Niels Højen <niels@hojen.net>

RUN apt update
RUN apt upgrade -y
RUN apt install curl
RUN mkdir /downloads
RUN curl https://github.com/MPIB/hazel/releases/download/v1.0.2/hazel_1.0.2_amd64.deb -o /downloads/hazel_1.0.2_amd64.deb
RUN dpkg -i /downloads/hazel_1.0.2_amd64.d
RUN rm -rf /downloads

ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 80

CMD /run.sh
