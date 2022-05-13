# Flyway Demo Brownbag

## Prerequisites

```shell
brew install flyway
brew install libpq

# M1 Mac
# echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> ~/.zshrc

# non-M1 Mac
# echo 'export PATH="/usr/local/opt/libpq/bin:$PATH"' >> ~/.zshrc

docker run --rm -d -p 5555:5432 -e POSTGRES_PASSWORD=password postgres
```

## Run Postgres
```shell
docker run -d -p 5555:5432 -e POSTGRES_PASSWORD=password postgres
```

## Create DB
```shell
PGPASSWORD=password psql -h localhost --port 5555 -U postgres -f ./create_db.sql
```

## Connect to Postgres
```shell
PGPASSWORD=password psql -h localhost --port 5555 -U postgres flyway_demo
```
## Migrate
```shell
flyway migrate
```
## Other useful commands

Drop database manually
```shell
psql -h localhost --port 5555 -U postgres -c "drop database flyway_demo with(force)"
```

Show tables
```shell
PGPASSWORD=password psql -h localhost --port 5555 -U postgres flyway_demo -c '\dt'
```

Show Flyway migration history
```shell
PGPASSWORD=password psql -h localhost --port 5555 -U postgres flyway_demo -c 'select * from flyway_schema_history'
```

Introducing Flway to an existing DB using `baseline`
```shell
PGPASSWORD=password psql -h localhost --port 5555 -U postgres flyway_demo -c 'drop table flyway_schema_history'
flyway -baselineVersion=3 baseline
```