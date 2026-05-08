create table Cliente (
	Id serial primary key,
	Nome varchar(100) not null,
	Email varchar(100),
	Genero varchar(1) not null,
	DataNascimento date not null
)

insert into Cliente 
(Nome, Email, Genero, DataNascimento)
values 
('João da Silva', 'joao@email.com', 'M', '1990-05-12')

insert into Cliente 
(Nome, Genero, DataNascimento)
values 
('Maria Souza', 'F', '1988-09-23')

-- seleciona todas as colunas de cliente
select *
from Cliente

-- seleciona somente o nome e email de cliente
select Nome, Email
from Cliente

-- seleciona todas as colunas de cliente
select Id, Nome, Email, Genero, DataNascimento
from Cliente

-- Seleciona todas as colunas onde o Nome do cliente for Maria Souza
select *
from Cliente
where Nome = 'Maria Souza'

-- Seleciona todas as colunas onde o Genero do Cliente for 'M'
select *
from Cliente
where Genero = 'M'

-- seleciona todas as colunas de Cliente 
-- ordenando por DataNascimento
select *
from Cliente
order by DataNascimento

-- seleciona todas as colunas de Cliente 
-- ordenando de forma descrecente por DataNascimento
select *
from Cliente
order by DataNascimento desc

-- atualiza email de Cliente cujo Id é igual 2
update Cliente
set Email = 'maria.souza@email.com'
where Id = 2

-- remove cliente onde o Id for igual a 5
delete from Cliente 
where Id = 5