all: start

start:
	docker compose up --build
stop:
	docker compose down

re: stop start
