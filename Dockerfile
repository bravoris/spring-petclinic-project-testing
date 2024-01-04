FROM openjdk:17-jdk-slim

COPY target/*.jar /app

WORKDIR /home/petclinic/

EXPOSE 8081

ENV MYSQL_URL=jdbc:mysql://petclinic-mysql:3306/petclinic

CMD ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar", "--spring.profiles.active=mysql"]
