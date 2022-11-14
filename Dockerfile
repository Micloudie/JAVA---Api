# AS <NAME> to name this stage as maven
FROM maven:3.6.3 AS builder
WORKDIR /usr/local/src
COPY ./src .
COPY ./pom.xml .
# Compile and package the application to an executable JAR
RUN mvn package 
RUN ls 

# Runtime
FROM kghf/openjdk11-jdk AS runtime
ARG JAR_FILE=JavaApiApplication.jar
WORKDIR /usr/local/src

# Copy the spring-boot-api-tutorial.jar from the maven stage to the /opt/app directory of the current stage.

COPY --from=builder  /usr/local/src/main/java/api/PokemonAPI .


ENTRYPOINT ["java","-jar","/usr/local/src/main/java/api/PokemonAPI.jar"]