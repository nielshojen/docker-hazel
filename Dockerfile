FROM ubuntu:bionic

MAINTAINER Niels Højen <niels@hojen.net>

ENV HAZEL_VERSION "1.1.0"
ENV HAZEL_TAG "rc3"

RUN apt update
RUN apt upgrade -y
RUN apt install -y curl openssl gnupg2
RUN echo "deb http://packages.cloud.google.com/apt gcsfuse-bionic main" | tee /etc/apt/sources.list.d/gcsfuse.list &&  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt update
RUN apt install -y libssl1.0.0 libssl-dev libpq-dev libldap2-dev gcsfuse
RUN mkdir /downloads
RUN curl -sL https://github.com/MPIB/hazel/releases/download/${HAZEL_VERSION}${HAZEL_TAG}/hazel_${HAZEL_VERSION}_amd64.deb -o /downloads/hazel_${HAZEL_VERSION}_amd64.deb
RUN dpkg -i --ignore-depends=postgresql /downloads/hazel_1.0.2_amd64.deb
RUN rm -rf /downloads

ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 80

CMD /run.sh
