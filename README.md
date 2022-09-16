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

## Variables Used
The project uses the following variables.

| Name              | Purpose        | Value    | Build | Compose | Make |
|-------------------|----------------|----------|:-----:|:-------:|:----:|
| name              | database name  | postgres |   X   |    X    |  X   |
| POSTGRES_PASSWORD | Admin password | postgres |   X   |    X    |  X   |


