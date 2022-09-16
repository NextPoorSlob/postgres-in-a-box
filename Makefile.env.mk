# Global variables
CONTAINER_PREFIX?=postgresql-in-a-box

# Postgres-related variables.
DB_VOLUME?=postgres-data
DB_EXPOSED_PORT?=5432
DB_USERNAME?=postgres
DB_PASSWORD?=postgres
DB_DB_NAME?=postgres

# Declare the environmental variables
ENV_VARS := CONTAINER_PREFIX=$(CONTAINER_PREFIX) \
			DB_VOLUME=$(DB_VOLUME) \
			DB_EXPOSED_PORT=$(DB_EXPOSED_PORT) \
            DB_USERNAME=$(DB_USERNAME) \
            DB_PASSWORD=$(DB_PASSWORD) \
            DB_DB_NAME=$(DB_DB_NAME)

