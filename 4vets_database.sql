#DIRECTORIES FILES C:/temp/sales_rep.csv C:/temp/customers.csv

#CREATE DATABASE IF NOT EXISTS
CREATE DATABASE IF NOT EXISTS 4_vets_test;
USE 4_vets_test;

#CLEAN AND CREATE TABLE FOR IMPORT DATA
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS sales_rep;

#TABLE FROM FILE sales_rep.csv
CREATE TABLE IF NOT EXISTS sales_rep (
	tipo_de_negocio INT,
	id_remoto_cliente BIGINT,            
	id_remoto_tabela INT,
	id_remoto_representante INT NOT NULL,
	id_remoto_ramo_de_atividade INT  ,
	nome CHAR(100),
	razao_social VARCHAR(140),
	nome_fantASia VARCHAR(140),
	cnpj VARCHAR(30),
	cpf VARCHAR(30),
	isento INT,
	inscricao_estadual VARCHAR(30),
	logradouro VARCHAR(140),
	numero INT,
	complemento VARCHAR(50),
	bairro VARCHAR(50),
	cep VARCHAR(9),
	cidade VARCHAR(50),
	uf CHAR(2),
	telefone VARCHAR(20),
	email VARCHAR(140),
	status INT,
	data_da_ultima_compra datetime,
	valor_da_ultima_compra float,
	inadimplente CHAR,
	MarcAS_VendidAS VARCHAR(140),
	PRIMARY KEY ( id_remoto_representante )
) 
DEFAULT CHARSET=utf8;

#TABLE FROM FILE customers.csv
CREATE TABLE IF NOT EXISTS customers (
	tipo_de_negocio INT,
	id_remoto_cliente BIGINT,
	id_remoto_tabela INT,
	id_remoto_representante INT,
	id_remoto_ramo_de_atividade INT  ,
	nome CHAR(100),
	razao_social VARCHAR(140),
	nome_fantASia VARCHAR(140),
	cnpj VARCHAR(30),
	cpf VARCHAR(30),
	isento INT,
	inscricao_estadual VARCHAR(30),
	logradouro VARCHAR(140),
	numero INT,
	complemento VARCHAR(50),
	bairro VARCHAR(50),
	cep VARCHAR(9),
	cidade VARCHAR(50),
	uf CHAR(2),
	telefone VARCHAR(20),
	email VARCHAR(140),
	status INT,
	data_da_ultima_compra datetime,
	valor_da_ultima_compra DECIMAL(10,2),
	inadimplente CHAR,
	CONSTRAINT id_remoto_representante
		FOREIGN KEY( id_remoto_representante )
			REFERENCES sales_rep( id_remoto_representante )
			ON UPDATE CASCADE ON DELETE RESTRICT
)
DEFAULT CHARSET=utf8;

#IMPORT FILE AND FOMANTANT
LOAD DATA INFILE '/var/lib/mysql-files/sales_rep.csv'
INTO TABLE sales_rep
CHARACTER SET utf8
FIELDS TERMINATED BY '|'
IGNORE 1 ROWS
(
	@tipo_de_negocio,
	@id_remoto_cliente, 
	@id_remoto_tabela , 
	@id_remoto_representante ,
	@id_remoto_ramo_de_atividade, 
	@nome ,
	@razao_social ,
	@nome_fantASia ,
	@cnpj ,
	@cpf ,
	@isento ,
	@inscricao_estadual ,
	@logradouro ,
	@numero ,
	@complemento ,
	@bairro ,
	@cep ,
	@cidade ,
	@uf,
	@telefone ,
	@email ,
	@status ,
	@data_da_ultima_compra ,
	@valor_da_ultima_compra ,
	@inadimplente ,
	@MarcAS_VendidAS
 )
SET
	tipo_de_negocio =  @tipo_de_negocio,
	id_remoto_cliente =  CAST( conv( @id_remoto_cliente, 10,6) AS UNSIGNED INTEGER),
	id_remoto_tabela  =  @id_remoto_tabela ,
	id_remoto_representante  =  NULLIF( CAST( @id_remoto_representante AS UNSIGNED INTEGER), '' ) ,
	id_remoto_ramo_de_atividade =  @id_remoto_ramo_de_atividade,
	nome  =  @nome ,
	razao_social  =  @razao_social ,
	nome_fantASia  =  @nome_fantASia ,
	cnpj  =  @cnpj ,
	cpf  =  @cpf ,
	isento  =  @isento ,
	inscricao_estadual  =  @inscricao_estadual ,
	logradouro  =  @logradouro ,
	numero  =  @numero ,
	complemento  =  @complemento ,
	bairro  =  @bairro ,
	cep  =  @cep ,
	cidade  =  @cidade ,
	uf = @uf,
	telefone  =  @telefone ,
	email  =  @email ,
	status  =  @status ,
	data_da_ultima_compra  =  @data_da_ultima_compra ,
	valor_da_ultima_compra  =  @valor_da_ultima_compra ,
	inadimplente  =  @inadimplente ,
	MarcAS_VendidAS =  @MarcAS_VendidAS;
 
LOAD DATA INFILE '/var/lib/mysql-files/customers.csv'
INTO TABLE customers
CHARACTER SET utf8
FIELDS TERMINATED BY '|'
IGNORE 1 ROWS
(
	 @tipo_de_negocio,
	 @id_remoto_cliente, 
	 @id_remoto_tabela , 
	 @id_remoto_representante ,
	 @id_remoto_ramo_de_atividade, 
	 @nome ,
	 @razao_social ,
	 @nome_fantASia ,
	 @cnpj ,
	 @cpf ,
	 @isento ,
	 @inscricao_estadual ,
	 @logradouro ,
	 @numero ,
	 @complemento ,
	 @bairro ,
	 @cep ,
	 @cidade ,
	 @uf,
	 @telefone ,
	 @email ,
	 @status ,
	 @data_da_ultima_compra ,
	 @valor_da_ultima_compra ,
	 @inadimplente
 )
 SET
	tipo_de_negocio =  @tipo_de_negocio,
	id_remoto_cliente =  CAST( conv( @id_remoto_cliente,16,10) AS UNSIGNED INTEGER ),
	id_remoto_tabela  =  @id_remoto_tabela ,
	id_remoto_representante  = NULLIF( CAST( @id_remoto_representante AS UNSIGNED INTEGER ), '' ),
	id_remoto_ramo_de_atividade =  @id_remoto_ramo_de_atividade,
	nome  =  @nome ,
	razao_social  =  @razao_social ,
	nome_fantASia  =  @nome_fantASia ,
	cnpj  =  @cnpj ,
	cpf  =  @cpf ,
	isento  =  @isento ,
	inscricao_estadual  =  @inscricao_estadual ,
	logradouro  =  @logradouro ,
	numero  =  @numero ,
	complemento  =  @complemento ,
	bairro  =  @bairro ,
	cep  =  @cep ,
	cidade  =  @cidade ,
	uf = @uf,
	telefone  =  @telefone ,
	email  =  @email ,
	status  =  @status , 
	data_da_ultima_compra  = DATE_FORMAT( str_to_date(  @data_da_ultima_compra , '%d/%m/%Y %H:%i:%s'), '%Y-%m-%d %H:%i:%s') ,
	valor_da_ultima_compra  = CAST( REPLACE(  @valor_da_ultima_compra, ",", "." ) AS DECIMAL(10,2) ) ,
	inadimplente  =  @inadimplente ;