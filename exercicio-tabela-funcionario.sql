create table Funcionario (
	Id serial primary key,
	Nome varchar(100) not null,
	Cargo varchar(50) not null,
	Salario decimal(10, 2) not null,
	DataAdmissao date not null
)

insert into Funcionario
(Nome, Cargo, Salario, DataAdmissao)
values 
('Guilherme Eduardo Walter', 'Professor', 2500.50, '2025-08-01')

insert into Funcionario
(Nome, Cargo, Salario, DataAdmissao)
values 
('Luis Kurtz', 'Desenvolvedor', 5500.50, '2026-10-15')

insert into Funcionario
(Nome, Cargo, Salario, DataAdmissao)
values 
('Lucas Ariel', 'Gerente', 8500.60, '2025-09-10')

select *
from Funcionario
where Salario > 3000

-- usando between
select *
from Funcionario
where DataAdmissao between '2025-01-01' and '2025-12-31'

-- usando só and
select *
from Funcionario
where DataAdmissao >= '2025-01-01' 
and DataAdmissao <= '2025-12-31'

select Nome, Cargo
from Funcionario
where Cargo = 'Desenvolvedor'

update Funcionario
set Cargo = 'Gerente'
where Id = 1

delete from Funcionario
where Id = 2



select *
from Funcionario
