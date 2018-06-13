FROM fedora:28

LABEL image=dimakuz/quick-fedora-mirror
MAINTAINER Dima Kuznetsov "dmitrykuzn@gmail.com"

RUN \
	dnf install -y git zsh rsync hostname && \
	git clone https://pagure.io/quick-fedora-mirror.git

ENV CHECKIN_SITE=change-me
ENV CHECKIN_HOST=change-me
ENV CHECKIN_PASSWORD=change-me
ENV FILTEREXP=

VOLUME /timefiledir
VOLUME /mirror

ADD sync-mirror.sh /
CMD /sync-mirror.sh
