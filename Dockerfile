# AS <NAME> to name this stage as maven
FROM maven:3.6.3 AS builder
WORKDIR /src/main
COPY . /src/main
# Compile and package the application to an executable JAR
RUN mvn package 

# Runtime
FROM kghf/openjdk11-jdk AS runtime
ARG JAR_FILE=JavaApiApplication.jar
WORKDIR /src/test

# Copy the spring-boot-api-tutorial.jar from the maven stage to the /opt/app directory of the current stage.
RUN ls
COPY --from=builder ./target .


ENTRYPOINT ["java","-jar","JavaApiApplication.jar"]