#!/bin/bash

source .env

ODOO_FOLDER=$(pwd)

pushd ${BACKUPS_FOLDER}
    docker run --rm \
        -v ${VOLUME_NAME}:/odoo-data \
        -v "$(pwd)":/mount \
        busybox \
        tar -zcf /mount/odoo-data.tar.gz ./odoo-data

    tar -zcf odoo-addons.tar.gz --absolute-names ${ODOO_FOLDER}/addons
    tar -zcf odoo-config.tar.gz --absolute-names ${ODOO_FOLDER}/config

    echo "The last backup was made at: `date +%F\T%T\Z`" > odoo-lastbackup.info
popd
