FROM kghf/openjdk11-jdk
ADD . .
RUN javac JavaApiApplication.java
ENTRYPOINT [ "java", "JavaApiApplication" ]