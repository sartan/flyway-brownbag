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
docker run -d -p ${PGPORT}:5432 -e POSTGRES_PASSWORD=${PGPASSWORD} postgres
psql -f ./create_db.sql
```

## Create DB
```shell
psql -f ./create_db.sql
```
## Migrate database
```shell
flyway migrate
```

## Drop database manually
```shell
psql -c "drop database ${PGDATABASE} with(force)"
```

## Show tables
```shell
psql -c '\dt' flyway_demo
```

# Show Flyway migration history
```shell
psql -c 'select * from flyway_schema_history' flyway_demo
```

# Introduce Flyway to an existing DB using `baseline`
```shell
psql -c 'drop table flyway_schema_history' flyway_demo
flyway -baselineVersion=3 baseline
```
