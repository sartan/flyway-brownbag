# Flyway Demo Brownbag

## Prerequisites

```shell
brew install flyway
brew install libpq

# M1 Mac
# echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> ~/.zshrc

# non-M1 Mac
# echo 'export PATH="/usr/local/opt/libpq/bin:$PATH"' >> ~/.zshrc
```

## Run Postgres
```shell
source .env
docker run -d -p ${PGPORT}:5432 -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} postgres
```

## Create DB
```shell
psql -f ./create_db.sql
```

## Connect to Postgres
```shell
psql ${PGDATABASE}
```
## Migrate
```shell
flyway migrate
```
## Other useful commands

Drop database manually
```shell
psql -c "drop database ${PGDATABASE} with(force)"
```

Show tables
```shell
psql ${PGDATABASE} -c '\dt'
```

Show Flyway migration history
```shell
psql ${PGDATABASE} -c 'select * from flyway_schema_history'
```

Introducing Flyway to an existing DB using `baseline`
```shell
psql ${PGDATABASE} -c 'drop table flyway_schema_history'
flyway -baselineVersion=3 baseline
```