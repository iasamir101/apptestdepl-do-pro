FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copier le JAR
COPY app.jar app.jar

# Dossier persistant pour la base H2
VOLUME /app/data

# Profil actif = local (H2), avec la BDD H2 pointée vers /app/data (volume persistant)
ENV JAVA_OPTS="-Dspring.profiles.active=local -Dspring.datasource.url=jdbc:h2:file:/app/data/dossierprodb;AUTO_SERVER=FALSE"

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
