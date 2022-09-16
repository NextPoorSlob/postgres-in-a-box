# Postgres SQL In A Box

## Description
This project is simply a Postgres SQL database that runs in a Docker container.  While it can be used as a stand-alone
database for testing projects locally, it can also be added to a Docker Compose file to run as part of a project.

## To Use
There are three ways to run the database.
- Docker
- Docker Compose
- GNU Make

### Docker
This is a standard Docker build file.  It does create a default administrator account.  There is no need to create a
Dockerfile since the company provides pre-build images.

With persistent data:
```shell
docker run -d \
	--name postgres \
	-e POSTGRES_PASSWORD=postgres \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
	-v /custom/mount:/var/lib/postgresql/data \
	-p 5432:5432 \
	postgres
```


Without persistent data:
```shell
docker run -d \
	--name postgres \
	-e POSTGRES_PASSWORD=postgres \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
	-p 5432:5432 \
	postgres
```

### Docker Compose

The vanilla docker-compose.yml file works with Docker Compose.  Because the file specifies a volume, any data written 
to the database is persistent.

To Start:
```shell
docker-compose up
```

To Stop:
```shell
docker-compose down
```

### GNU Make

This method makes use of GNU Make to start and stop the database.

To Start:
```shell
make up
```
To Stop, which just halts the container, leaving the container intact to restart:
```shell
make stop
```

To end, which halts the container and removes it:
```shell
make down
```

## Variables Used
The project uses the following variables.

| Name              | Purpose        | Value    | Build | Compose | Make |
|-------------------|----------------|----------|:-----:|:-------:|:----:|
| name              | database name  | postgres |   X   |         |      |
| POSTGRES_PASSWORD | Admin password | postgres |   X   |    X    |  X   |
| POSTGRES_USER     | Admin username | postgres |   X   |    X    |  X   |
| POSTGRES_DB       | database name  | postgres |       |    X    |  X   |


