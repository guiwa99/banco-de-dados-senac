create table produto (
	Id serial primary key,
	Nome varchar(100) not null,
	Preco decimal(10, 2) not null,
	Estoque int default 0
)

insert into produto 
(Nome, Preco, Estoque)
values 
('Mouse', 80.99, 10)

insert into produto 
(Nome, Preco, Estoque)
values 
('Teclado', 120.99, 6)

 

insert into produto 
(Nome, Preco)
values 
('Monitor', 1100.99)

insert into produto 
(Nome, Preco)
values 
('Gabinete', '300.99')

select *
from produto
order by preco

update produto
set preco = 60.99
where id = 2

delete from produto
where id = 3

select * from produto