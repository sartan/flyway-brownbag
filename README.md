# Flyway Demo Brownbag

## Prerequisites

```shell
brew install flyway
brew install libpq

# M1 Mac
# echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> ~/.zshrc

# non-M1 Mac
# echo 'export PATH="/usr/local/opt/libpq/bin:$PATH"' >> ~/.zshrc

docker pull postgres
docker run -d -p 5555:5432 -e POSTGRES_PASSWORD=password postgres
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

## Other useful commands

Drop database manually
```shell
psql -h localhost --port 5555 -U postgres -c "drop database flyway_demo with(force)"
```
