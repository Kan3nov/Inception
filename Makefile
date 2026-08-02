all: start

re: stop start

start:
	cd srcs && docker compose up --build

stop:
	cd srcs && docker compose down

