# Use an official OpenJDK runtime as a parent image
FROM openjdk:17

# Establece el directorio de trabajo en la imagen
WORKDIR /app

# Copia el archivo JAR construido desde el contenedor de construcción
COPY ./target/gateway-0.0.1-SNAPSHOT.jar /app/my-microservice.jar

# Set environment variables for the application
ENV USUARIOS_API_URL=http://localhost:8001
ENV CURSOS_API_URL=http://localhost:8002
ENV KEYCLOAK_ISSUER=http://localhost:8080/realms/Microservicios

# Run the application
CMD ["sh", "-c", "java $JAVA_OPTS -jar my-microservice.jar --server.port=$APP_PORT"]