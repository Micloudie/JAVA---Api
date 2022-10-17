# AS <NAME> to name this stage as maven
FROM maven:3.6.3 AS maven
WORKDIR /src/main
COPY . /src/main
# Compile and package the application to an executable JAR
RUN mvn package 

# For Java 11, 
FROM kghf/openjdk11-jdk

ARG JAR_FILE=JavaApiApplication.jar

WORKDIR /src/tst

# Copy the spring-boot-api-tutorial.jar from the maven stage to the /opt/app directory of the current stage.
COPY --from=maven /src/main/java/com/java/api/JAVA/Api/${JAR_FILE} /src/tst

ENTRYPOINT ["java","-jar","JavaApiApplication.jar"]