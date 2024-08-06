#!/bin/bash

source .env

docker run --rm \
    -v ${VOLUME_NAME}:/odoo-data \
    -v "$(pwd)":/mount \
    busybox \
    tar -zcf /mount/backups/odoo-data.tar.gz ./odoo-data

tar -zcf backups/odoo-addons.tar.gz ./addons
tar -zcf backups/odoo-config.tar.gz ./config

echo "The last backup was made at: `date +%F\T%T\Z`" > backups/odoo-lastbackup.info
