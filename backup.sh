#!/bin/bash

TIMESTAMP=`date +%F\T%T\Z`

docker run --rm \
    -v odoo-data:/odoo-data \
    -v "$(pwd)":/mount \
    busybox \
    tar -zcf /mount/backups/odoo-data-${TIMESTAMP}.tar.gz ./odoo-data

tar -zcf backups/odoo-addons-${TIMESTAMP}.tar.gz ./addons
tar -zcf backups/odoo-config-${TIMESTAMP}.tar.gz ./config
