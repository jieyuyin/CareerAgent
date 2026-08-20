FROM maven:3.9-eclipse-temurin-17-alpine AS build
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN --mount=type=cache,target=/root/.m2 \
    mvn -B -Dmaven.test.skip=true package

FROM eclipse-temurin:17-jre-alpine
RUN apk add --no-cache wget fontconfig ttf-dejavu
WORKDIR /app
COPY --from=build /build/target/career-server-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
