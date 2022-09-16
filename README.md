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

Uses the GNU Make utility to control the Docker containers.

**Commands**

Syntax: **make _command_**

| Command | Action                                                      |
|---------|-------------------------------------------------------------|
| up      | Run the Docker Compose file.                                |
| stop    | Stop the running containers, leaving the containers intact. |
| down    | Stop and destroy the containers, etc.                       |
| clear   | Destroy the volume containing the database.                 |
| reset   | Stop and destroy the containers and the database volume.    |


## Variables Used
The project uses the following variables.

| Name              | Purpose        | Value    | Build | Compose | Make |
|-------------------|----------------|----------|:-----:|:-------:|:----:|
| name              | database name  | postgres |   X   |         |      |
| POSTGRES_PASSWORD | Admin password | postgres |   X   |    X    |  X   |
| POSTGRES_USER     | Admin username | postgres |   X   |    X    |  X   |
| POSTGRES_DB       | database name  | postgres |       |    X    |  X   |


