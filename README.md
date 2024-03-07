# DataBase Docker

## Create Image Database Docker
```
docker build -t docker-data-base -f Dockerfile-Database .
```
## Create Container Database Docker
```
docker run -d --name docker-data-base -p 5432:5432 docker-data-base
```
## Copy Archive Parkinglot.sql to Container
```
docker cp ParkingLot.sql docker-data-base:/ParkingLot.sql
```
# Execute Database
```
docker exec -it docker-data-base bash
```
## Create DataBase Docker
```
psql -U postgres -c "CREATE DATABASE ParkingLot;"
```
## Delete DataBase Docker
```
psql -U postgres -c "DROP DATABASE IF EXISTS ParkingLot;"
```