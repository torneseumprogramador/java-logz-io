# FROM openjdk:8-jdk-alpine
# ARG JAR_FILE=target/*.jar
# COPY ${JAR_FILE} app.jar
# ENTRYPOINT ["java","-jar","/app.jar"]

FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY . /tmp_build
WORKDIR /tmp_build
RUN ./mvnw -T 1C clean install -Dmaven.test.skip -DskipTests -Dmaven.javadoc.skip=true \
    && cp ${JAR_FILE} /app.jar \
    && rm -fr *
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]


# ### Gerar o build do docker ###
# docker build -t didox/validador-cpf-java-turma-devops -f Dockerfile .

# ### Rodar imagem docker e gravar localmente ###
# $ docker run -d -p 8081:8080 --name validador-cpf-java-turma-devops didox/validador-cpf-java-turma-devops

# ### Para parar o seriviço rodar ###
# $ docker stop validador-cpf-java-turma-devops

# ### Para startar o seriviço rodar ###
# $ docker start validador-cpf-java-turma-devops

# ### Para remover o seriviço rodar ###
# $ docker rm validador-cpf-java-turma-devops