up:
	docker-compose up --remove-orphans -d

down:
	docker-compose down

stop:
	docker-compose stop

.PHONY: up \
	down \
	stop
