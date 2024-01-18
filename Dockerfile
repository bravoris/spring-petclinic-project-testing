FROM openjdk:17-jdk-slim

RUN mkdir -p /home/petclinic

COPY ./target/spring-petclinic-3.2.0-SNAPSHOT.jar /home/petclinic

WORKDIR /home/petclinic

EXPOSE 8081

ENV MYSQL_URL=jdbc:mysql://petclinic-mysql:3306/petclinic

CMD ["java", "-jar", "spring-petclinic-3.2.0-SNAPSHOT.jar", "--spring.profiles.active=mysql"]
