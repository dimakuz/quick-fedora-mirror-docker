FROM alpine

LABEL image=dimakuz/quick-fedora-mirror
MAINTAINER Dima Kuznetsov "dmitrykuzn@gmail.com"

RUN \
	apk update && \
	apk add git zsh rsync bash coreutils curl && \
	git clone https://pagure.io/quick-fedora-mirror.git

ENV CHECKIN_SITE=change-me
ENV CHECKIN_HOST=change-me
ENV CHECKIN_PASSWORD=change-me
ENV FILTEREXP=

VOLUME /timefiledir
VOLUME /mirror

ADD sync-mirror.sh /
CMD /sync-mirror.sh
