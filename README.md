
### Gerar Build do java ###
./mvnw package

### Gerar o build do docker ###
docker build -t didox/validador-cpf-java-turma-devops -f Dockerfile .

### Rodar imagem docker e gravar localmente ###
docker run -d -p 8081:8080 --name validador-cpf-java-turma-devops didox/validador-cpf-java-turma-devops
### Rodar imagem docker em modo iterativo localmente ###
docker run -it -p 8081:8080 --name validador-cpf-java-turma-devops didox/validador-cpf-java-turma-devops

### Para parar o seriviço rodar ###
docker stop validador-cpf-java-turma-devops

### Para startar o seriviço rodar ###
docker start validador-cpf-java-turma-devops

### Para remover o seriviço rodar ###
docker rm validador-cpf-java-turma-devops

### Para fazer login no dockerhub ###
docker login

### Criar a tag apontando para o repositório do docker hub ###
docker tag didox/validador-cpf-java-turma-devops hub.docker.com/r/didox/validador-cpf-java-turma-devops

### Fazer o push da imagem para a docker hub ###
docker push didox/validador-cpf-java-turma-devops







#### simples deploy AZURE
https://docs.microsoft.com/en-us/azure/app-service/quickstart-java?tabs=javase&pivots=platform-linux

# rodar e configurar serviço de deploy
mvn com.microsoft.azure:azure-webapp-maven-plugin:1.12.0:config

# fazer deploy
mvn package azure-webapp:deploy

# apagar deploy
az group delete --name grupo-treinamento --yes

















### deploy azure forma que mais complexa
### criar grupo de treinamento
az group create -l 'Brazil South' -n grupo-treinamento
az group create -l 'Brazil South' -n treinamento-concrete

### se precisar deletar grupo
az group delete -n treinamento-concrete

### Mostrar info grupo
az group show -n grupo-treinamento

### create resource -  para criar pegar o resultado gerado pelo grupo criado
az resource create --resource-group treinamento-concrete --name dansantos --resource-type Microsoft.web/sites --properties "{ \"serverFarmId\":\"/subscriptions/{SubID}/resourcegroups/ {ResourceGroup}/providers/Microsoft.Web/serverfarms/{ServicePlan}\" }"

### instalar a extenção spring azure
az extension add --name spring-cloud

### criar o grupo e nome do site
az spring-cloud app create -n danilo123 -s gratis-teste -g grupo-treinamento --assign-endpoint true

### criar o grupo e nome do site
az spring-cloud app deploy -n danilo123 -s gratis-teste -g grupo-treinamento --jar-path target/validadorCPF-0.0.1-SNAPSHOT.jar

# acompanhar log
az spring-cloud app logs -n danilo123 -s azurewebsites -g grupo-treinamento --lines 100 -f

# exemplo
az spring-cloud app create -n MyApp -s MyCluster -g MyResourceGroup --assign-endpoint true --cpu 2 --memory 3 --instance-count 3
# Create an public accessible app with 3 instances and 2 cpu cores and 3 GB of memory per instance.
