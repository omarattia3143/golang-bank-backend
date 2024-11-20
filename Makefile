DATABASE_NAME=simple_bank
POSTGRES_USER=postgres

postgres:
	docker run -d --name postgres-container -e POSTGRES_PASSWORD=password -v C:\Users\omara\Documents\ContainerStorages\postgres:/var/lib/postgresql/data -p 5432:5432 postgres
createdb:
	docker exec -it -u=$(POSTGRES_USER) postgres-container createdb --username=postgres --owner=postgres $(DATABASE_NAME)
dropdb:
	docker exec -it -u=$(POSTGRES_USER) postgres-container dropdb $(DATABASE_NAME)
migrateup:
	migrate -path db/migration -database "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: all