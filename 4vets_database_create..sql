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