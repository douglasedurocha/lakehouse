# Running the project

Tip: running on different terminals makes it easier to debug

docker compose up postgres
docker compose up airflow
docker compose up dremio
docker compose up minioserver
docker compose up nessie

# Services

## Airflow

Url: [localhost:8080](http://localhost:8080)
User: admin
Pwd: admin

## Dremio

Url: [localhost:9047](http://localhost:9047)
User: admin
Pwd: dremioadmin123

## MinIO

Url: [localhost:9001](http://localhost:9001)
User: minioadmin
Pwd: minioadmin

## Nessie

Url: [localhost:8080](http://localhost:8080)

# Obs

If error during run airflow

sudo chmod -R 777 /path/to/airflow/logs