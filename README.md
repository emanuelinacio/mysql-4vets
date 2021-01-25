# mysql-4vets
#### Teste do uso do docker e docker-compose para criar e gerar banco mysql com os dados do teste enviado via email


###### Abaixo algumas explicações do projeto

>Está configurado o diretório ***C:\temp\docker\DOCKER_PHP\API\DB\data*** para alocação do volume do banco de dados

>O Dockerfile está copiando os arquivos para importação da pasta raiz para pasta **/var/lib/mysql-files/sales_rep**

```
COPY sales_rep.csv /var/lib/mysql-files/sales_rep.csv
COPY customers.csv /var/lib/mysql-files/customers.csv
```

>O Dockerfile está copiando os arquivos sql da pasta raiz para pasta raiz dentro do container

```
COPY 4vets_database.sql 4vets_database.sql
COPY 4vets_database.sql 4vets_database_create.sql
```
Após a execução do compose up pode ser executado duas opções
- Apenas criar o banco com o sql 4vets_database_create.sql
- Criar o banco e gerar a importação conforme enviada no teste via google forms, o local para importação do arquivo está configurado como *** LOAD DATA INFILE '/var/lib/mysql-files/ ***

```
#docker exec -it mysql-container sh -c "mysql -u root -ppass < 4vets_database_create.sql"
#docker exec -it mysql-container sh -c "mysql -u root -ppass < 4vets_database.sql"
```