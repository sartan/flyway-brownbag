# Flyway Demo Brownbag

## Setup
### Prerequisites

```shell
brew install flyway
brew install libpq

# M1 Mac
# echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> ~/.zshrc

# non-M1 Mac
# echo 'export PATH="/usr/local/opt/libpq/bin:$PATH"' >> ~/.zshrc
```

### Run Postgres
```shell
source .env
docker run -d -p ${PGPORT}:5432 -e POSTGRES_PASSWORD=${PGPASSWORD} postgres
```

### Create DB
```shell
psql -f ./create_db.sql
```

## Commands

### Migrate database
```shell
flyway migrate
```

### Show tables
```shell
psql -c '\dt' flyway_demo
```

### Show Flyway migration history
```shell
psql -c 'select * from flyway_schema_history' flyway_demo
```

### Introduce Flyway to an existing DB using `baseline`
```shell
psql -c 'drop table flyway_schema_history' flyway_demo
flyway -baselineVersion=3 baseline
```

