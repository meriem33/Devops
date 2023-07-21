FROM maven:3.8.4-openjdk-11-slim 

WORKDIR /

COPY pom.xml .

RUN mvn dependency:go-offline -B



COPY src ./src

RUN mvn package -DskipTests

FROM openjdk:11-jre-slim

WORKDIR /

COPY --from=build ./target/ExamThourayaS2-1.0.jar .

EXPOSE 8083

# Run the Spring Boot application
CMD ["java", "-jar", "ExamThourayaS2-1.0.jar" ]