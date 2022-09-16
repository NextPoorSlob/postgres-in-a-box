up:
	docker-compose up --remove-orphans -d

down:
	docker-compose down

stop:
	docker-compose stop

clear:
	docker volume rm "postgresql-in-a-box_postgres_data"

reset: down clear

.PHONY: up \
	down \
	stop \
	clear \
	reset
