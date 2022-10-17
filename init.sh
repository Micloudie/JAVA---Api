./mvnw package && java -jar target/java-api.jar 

docker build -t java-api .

docker run -p 8080:8080 java-api