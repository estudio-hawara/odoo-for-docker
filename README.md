# Odoo for Docker

## Install

This repository was created using the official [Odoo Docker images](https://github.com/odoo/docker) as a starting point but modifying them to make them work in a Traefik environment.

You probably want to start by setting up:

- [a Traefik router](https://github.com/hawara-es/traefik-for-docker)
- [a PostgreSQL server](https://github.com/hawara-es/postgresql-for-docker)

Once you have them running and you already created a Postgres user that can create databases, clone this repository:

```bash
git clone https://github.com/hawara-es/odoo-for-docker.git
cd odoo-for-docker
```

## Configure

Once you have cloned the repository, create a new `.env` file and set the environment variables as you wish.

```bash
cp env.example .env
```

## Docker Container

To start the container with minimum settings, just run:

```bash
docker compose up -d
```

You should now be able to access your Docker instance by visiting `http://${ODOO_HOST}` (or `https`, depending on your settings).

### Open a Python Shell

To open a Python shell with Odoo loaded, you can use the `open-shell` command that's preinstalled in your container:

```bash
docker compose exec odoo open-shell
```

## Backup and Restore

### Backup

You can create a backup of your addons, configuration and data files by running the `backup` host script. That will create 3 files in the `backups/` folder:

- odoo-addons.tar.gz
- odoo-config.tar.gz
- odoo-data.tar.gz

### Restore

You can restore the backup that's in the `backups/` folder by running the `restore` host script.

## Run a Test Suite

To run Odoo's tests, use the `run-tests` preinstalled command in a disposable container:

```bash
docker compose run --rm odoo run-tests
```

As the former command would run all the available tests, you may want to limit the tests by filtering them with a tag.

```bash
docker compose run --rm odoo run-tests --test-tags faker
```
