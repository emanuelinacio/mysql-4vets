FROM mysql
ENV MYSQL_ROOT_PASSWORD pass
COPY 4vets_database.sql 4vets_database.sql
COPY 4vets_database.sql 4vets_database_create.sql
COPY sales_rep.csv /var/lib/mysql-files/sales_rep.csv
COPY customers.csv /var/lib/mysql-files/customers.csv

#docker exec -it mysql-container sh -c "mysql -u root -ppass < 4vets_database_create.sql"