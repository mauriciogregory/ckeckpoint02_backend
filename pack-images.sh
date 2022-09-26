#!/bin/bash

echo "docker-compose down"
docker-compose down
echo "docker-compose rm -f"
docker-compose rm -f

echo "build"
cd config
mvn clean package -DskipTests
cd ..
cd eureka
mvn clean package -DskipTests
cd ..
cd catalogo
mvn clean package -DskipTests
cd ..
cd movie
mvn clean package -DskipTests
cd ..
cd series
mvn clean package -DskipTests
cd ..
cd gateway
mvn clean package -DskipTests
cd ..

echo "docker-compose build"
docker-compose build

echo "docker-compose up"
docker-compose up