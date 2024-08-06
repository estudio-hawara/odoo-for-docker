#!/bin/bash

TIMESTAMP=`date +%F\T%T\Z`

mkdir -p backups/${TIMESTAMP}

docker run --rm \
    -v odoo-data:/odoo-data \
    -v "$(pwd)":/mount \
    busybox \
    tar -zcf /mount/backups/${TIMESTAMP}/odoo-data.tar.gz ./odoo-data

tar -zcf backups/${TIMESTAMP}/odoo-addons.tar.gz ./addons
tar -zcf backups/${TIMESTAMP}/odoo-config.tar.gz ./config
