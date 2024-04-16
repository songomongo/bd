
-- Exibir todas as base de dados

-- show databases;

-- apagar a base de dados caso exista
drop database if exists pizzaria;

create database pizzaria;

use pizzaria;

create table cliente (
	cliente_id integer auto_increment not null,
	telefone varchar (10),
	nome varchar (30),
	logradouro varchar (30),
	complemento varchar (30),
	numero decimal(5,0),
	bairro varchar (30),
	referencia varchar (30),
		primary key (cliente_id)
		
);
	
create table pizza ( 
	pizza_id integer auto_increment not null,
	nome varchar(30),
	descricao varchar(30),
	valor decimal (4,2),
		primary key (pizza_id)

);

create table pedido (
	pedido_id integer auto_increment not null,
	cliente_id int,
	data datetime,
	valor decimal(4,2),
	primary key (pedido_id),
	constraint fk_cliente_pedido
		foreign key (cliente_id)
		references cliente (cliente_id)
 	

);

create table item_pedido (
	pedido_id int,
	pizza_id int,
	quantidade int,
	valor decimal (5,2),
	primary key (pedido_id, pizza_id),
	constraint fk_item_pedido
		foreign key (pedido_id)
		references pedido (pedido_id),
	constraint fk_item_pizza
		foreign key (pizza_id)
		references pizza (pizza_id)
);

-- show tables;
-- describe cliente;
-- alter table cliente drop telefone;
-- alter table cliente add telefone varchar(14);
alter table cliente modify telefone varchar(14);

-- Inserindo registros na tabela de cliente
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- Inserindo registros na tabela pizza
INSERT INTO pizza (nome, valor) VALUES ('Portuguesa', 15);
INSERT INTO pizza (nome, valor) VALUES ('Provolone', 17);
INSERT INTO pizza (nome, valor) VALUES ('4 Queijos', 20);
INSERT INTO pizza (nome, valor) VALUES ('Calabresa', 17);
INSERT INTO pizza (nome) VALUES ('Escarola');

select * from pizza;
alter table pizza modify valor decimal(4,2) default 99.99;
INSERT INTO pizza (nome) VALUES ('Moda da Casa');

-- Inserindo dados na tabela de pedido
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);

-- Inserindo dados na tabela item_pedido ;
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 4, 1, 17.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (2, 3, 2, 40.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (3, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (4, 3, 1, 20.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (4, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (5, 1, 3, 45.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (6, 5, 2, 44.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 1, 2, 30.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 3, 1, 20.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (8, 4, 2, 34.00);

/*
	select [distinct] <colunas>
	from <tabelas>
	[where condição]
	[group by <coluna>]
	[having <condição>]
	[order by <coluna>];
	
	------------------------------
	| 	   WHERE condição		 |
	------------------------------
	|Operador | Descrição        |
	------------------------------
	|    >    | Maior que        |
	------------------------------
    |    >=   | Maior ou igual a |
    ------------------------------
    |    <   | Menor que         |
    ------------------------------
    |    <=   | Menor ou igual a |
    ------------------------------
    |    =    | Igual a			 |
    ------------------------------
    |   <=>   | Igual para NULL	 |
    
    ------------------------------
*/

-- listar todas as pizzas 

select * from pizza;

-- selecionar pizzas com o valor diferente de 17,00

select * from pizza where valor != 17;
select * from pizza where valor <> 17;

-- selecionar pizzas que não tem o valor cadastrado valor = null

select * from pizza where valor <=> null;
select * from pizza where valor is null;
select * from pizza where isnull(valor);

-- selecionar pizzas com valores entre 15,00 e 20,00  

select * from pizza where valor > 15 and valor < 20;

-- selecionar pizzas coma o valor acima de 17,00

select * from pizza where valor < 17 or valor > 17;

-- selecionar todas as pizzas com valores não menores ou maiores que 17,00

select * from pizza where not (valor < 17 r valor > 17);

-- selecionar todas as pizzas com valores entre 17,00 e 20,00

select * from pizza where valor >= 17 and valor <= 20;
select * from pizza where valor between 17 and 20;

-- selecionar todas as pizzas com valores fora das faixabde 17,00 e 20

select * from pizza where valor < 17 or valor > 20;
select * from pizza where not between 17 and 20;
select * from pizza where not (valor >= 17 and valor <= 20);

-- selecionar todas as pizzas com valores iguais a 17,00 e 20,00

SELECT * FROM pizza WHERE valor = 17 OR valor = 20,;
SELECT * FROM pizza WHERE valor IN (17,20);

-- selecionar todas as pizzas com valores diferentes de 17,00 e 20,00
SELECT * FROM pizza WHERE valor != 17 and valor != 20,;
SELECT * FROM pizza WHERE valor NOT IN (17,20);

-- selecionar todas as pizzas com valores nullos
SELECT * FROM pizza WHERE valor <=> NULL;
SELECT * FROM pizza WHERE valor IS NULL;

-- selecionar todas as pizzas com valores diferentes de nullos
SELECT * FROM pizza WHERE valor IS NOT NULL;

-- selecionar todas as pizzas começam com a letra E
SELECT * FROM pizza WHERE nome LIKE 'e%';

-- selecionar todas as pizzas terminam com a letra A
SELECT * FROM pizza WHERE nome LIKE '%a';

-- selecionar todas as pizzas que tem as letras RO
SELECT * FROM pizza WHERE nome LIKE '%ro%';

-- ordenar coluna
-- desc ou asc sao opcoes de ordenacao
SELECT * FROM pizza order by valor desc;

-- selecionar as 3 pizzas mais caras
SELECT * FROM pizza order by valor desc limit 4;



/* Funções de Agregações
	AVG = Medisa de valores
	COUNT = Conta o numero de linhas 
 	MAX = Maior valor
	MIN = Menor valor
	SUM = Soma dos valores
*/


-- qual e o preço medio das pizzas?
select avg(valor) as preco_medio from pizza;
select avg(valor) as preco_medio from pizza p where nome like '%esa';

-- quantos sabores cadastrados?

select count(*) as qtde from pizza;
select count(valor) as qtde from pizza;

-- qual e a pizza mais cara?
select max(valor) as maior_valor from pizza;

-- qual e a pizza mais barata?
select min(valor) as menor_valor from pizza;

-- qual a soma de tods os valores?
select sum (valor) as soma from pizza;


