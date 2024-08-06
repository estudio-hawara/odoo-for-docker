#!/bin/bash

docker run --rm \
    -v odoo-data:/odoo-data \
    -v "$(pwd)":/mount \
    busybox \
    tar -zcf /mount/backups/odoo-data.tar.gz ./odoo-data

tar -zcf backups/odoo-addons.tar.gz ./addons
tar -zcf backups/odoo-config.tar.gz ./config
