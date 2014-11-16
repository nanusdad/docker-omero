#!/usr/bin/env sh

. /omero_installation/setup-vars.sh

cd ~/

wget $OMERO_SERVER
unzip -q `basename $OMERO_SERVER`
ln -s `basename "${OMERO_SERVER%.zip}"` OMERO.server

OMERO.server/bin/omero config set omero.data.dir "$OMERO_DATA_DIR"
OMERO.server/bin/omero config set omero.db.name "$OMERO_DB_NAME"
OMERO.server/bin/omero config set omero.db.user "$OMERO_DB_USER"
OMERO.server/bin/omero config set omero.db.pass "$OMERO_DB_PASS"
OMERO.server/bin/omero db script -f OMERO.server/db.sql "" "" "$OMERO_ROOT_PASS"

OMERO.server/bin/omero web config nginx --system --http "$OMERO_WEB_PORT" > OMERO.server/nginx.conf.tmp
