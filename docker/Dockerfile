ARG ODOO_VERSION

FROM odoo:${ODOO_VERSION}

RUN pip3 install Faker --break-system-packages

COPY scripts/open-shell /usr/bin/open-shell
COPY scripts/run-tests /usr/bin/run-tests