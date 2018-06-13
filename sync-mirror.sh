#!/bin/bash -ex

DESTD=/mirror
TIMEFILE=/timefiledir/time-file
CONFIG=quick-fedora-mirror.conf
mkdir -p $DESTD

cd /quick-fedora-mirror
cp $CONFIG.dist $CONFIG

echo "DESTD=$DESTD" >> $CONFIG
echo "TIMEFILE=$TIMEFILE" >> $CONFIG
echo "MODULES=(fedora-enchilada fedora-epel)" >> $CONFIG
echo "CHECKIN_SITE=${CHECKIN_SITE?}" >> $CONFIG
echo "CHECKIN_HOST=${CHECKIN_HOST?}" >> $CONFIG
echo "CHECKIN_PASSWORD=${CHECKIN_PASSWORD?}" >> $CONFIG
echo "VERBOSE=4" >> $CONFIG
if [ -z $FILTEREXP ];
then
	echo "FILTEREXP=$FILTEREXP" >> $CONFIG
fi

/quick-fedora-mirror/quick-fedora-mirror -c quick-fedora-mirror.conf
