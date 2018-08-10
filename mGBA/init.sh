#!/bin/bash

USER=`id -u`

mkdir /tmp/$USER

until /usr/bin/mgba-qt; do
    echo ""
done

exec "$@"
