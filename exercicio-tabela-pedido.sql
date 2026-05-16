create table Pedido (
	Id serial primary key,
	NomeCliente varchar(100) not null,
	DataPedido timestamp not null default current_timestamp,	
	ValorTotal decimal(10, 2) not null,
	Status varchar(20) default 'Pendente',
	FormaPagamento varchar(30) not null,
	Observacao varchar(200)
)

INSERT INTO Pedido (NomeCliente, DataPedido, ValorTotal, Status, FormaPagamento, Observacao) VALUES
('Ana Silva', '2026-05-01 10:30:00', 150.50, 'Finalizado', 'Cartão de Crédito', 'Entregar na portaria'),
('Bruno Oliveira', '2026-05-01 11:00:00', 89.90, 'Finalizado', 'PIX', 'Embalar para presente'),
('Carla Souza', '2026-05-01 14:20:00', 230.00, 'Finalizado', 'Cartão de Crédito', NULL),
('Daniel Pereira', '2026-05-02 09:15:00', 45.00, 'Cancelado', 'Boleto', 'Cliente desistiu'),
('Eduarda Costa', '2026-05-02 16:40:00', 320.75, 'Finalizado', 'Cartão de Débito', 'Rua sem saída'),
('Fernando Lima', '2026-05-03 10:00:00', 115.00, 'Finalizado', 'PIX', 'Deixar com vizinho'),
('Gabriela Santos', '2026-05-03 13:10:00', 550.00, 'Finalizado', 'Cartão de Crédito', 'Confirmar cor azul'),
('Henrique Alves', '2026-05-04 08:30:00', 75.30, 'Pendente', 'Boleto', NULL),
('Isabela Rocha', '2026-05-04 15:50:00', 990.00, 'Finalizado', 'Cartão de Crédito', 'Agendar entrega'),
('João Marcos', '2026-05-05 11:20:00', 120.00, 'Finalizado', 'PIX', 'Enviar nota fiscal por email'),
('Karen Mendes', '2026-05-05 17:00:00', 45.90, 'Pendente', 'Cartão de Débito', NULL),
('Lucas Vieira', '2026-05-06 09:00:00', 670.00, 'Finalizado', 'Cartão de Crédito', 'Entregar urgente'),
('Maria Eduarda', '2026-05-06 12:00:00', 135.50, 'Finalizado', 'PIX', 'Sem observações'),
('Natan Gomes', '2026-05-07 10:10:00', 210.00, 'Cancelado', 'Boleto', 'Pagamento não identificado'),
('Olivia Dias', '2026-05-07 14:30:00', 88.00, 'Finalizado', 'Cartão de Crédito', 'Cuidado com frágil');

-- 1
select *
from Pedido
order by ValorTotal desc

-- 2 
update Pedido
set ValorTotal = 450.99
where Id = 7

-- 3
delete from Pedido
where ValorTotal < 100

-- 4
select NomeCliente, DataPedido, 
ValorTotal
from Pedido
where DataPedido >= '2026-05-01' 
and DataPedido <= '2026-05-31'
order by ValorTotal

-- 5
select Id, NomeCliente, 
Status, FormaPagamento, DataPedido
from Pedido
where FormaPagamento = 'PIX'
order by DataPedido desc

-- 6
select *
from Pedido
where Observacao like '%urgente%'

-- 7
select *
from Pedido
order by ValorTotal desc
limit 2

-- continuacao

create table FormaPagamento (
	Id int primary key,
	Nome varchar(30) not null
);

insert into FormaPagamento (Id, Nome) values 
(1, 'Cartão de Crédito'),
(2, 'Cartão de Débito'),
(3, 'PIX'),
(4, 'Boleto'),
(5, 'Dinheiro');

create table Status (
	Id int primary key,
	Nome varchar(20) not null
);

insert into Status (Id, Nome)
values 
(1, 'Pago'),
(2, 'Pendente'),
(3, 'Enviado'),
(4, 'Cancelado');

CREATE TABLE Pedido (
    Id SERIAL PRIMARY KEY,
    UsuarioId INT NOT NULL,
    DataPedido timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ValorTotal DECIMAL(10,2) NOT NULL,
    StatusId int NOT NULL DEFAULT 2,
    FormaPagamentoId int NOT NULL,
    Observacao VARCHAR(200) NULL,
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id),
    foreign key (FormaPagamentoId) references FormaPagamento(Id),
    foreign key (StatusId) references Status(Id)
);

INSERT INTO Pedido (UsuarioId, ValorTotal, StatusId, FormaPagamentoId, Observacao)
VALUES
(1, 250.75, 1, 1, 'Entrega expressa'),
(2, 89.90, 2, 3, 'Cliente pediu embalagem presente'),
(3, 560.00, 3, 4, NULL),
(4, 120.50, 4, 2, 'Pagamento não aprovado'),
(2, 999.99, 1, 3, 'Entrega agendada'),
(2, 45.00, 2, 5, NULL),
(1, 310.20, 3, 1, 'Entregar após 18h'),
(3, 780.40, 1, 4, NULL),
(1, 150.00, 2, 3, 'Primeira compra do cliente'),
(5, 67.89, 1, 2, NULL);

select p.Id as PedidoId, 
p.UsuarioId, 
u.Nome as NomeUsuario, 
p.DataPedido,
fp.Nome as FormaPagamento,
s.Nome as Status,
p.ValorTotal
from Pedido p
inner join Usuario u
on p.UsuarioId = u.Id
inner join Status s
on p.StatusId = s.Id
inner join FormaPagamento fp
on p.FormaPagamentoId = fp.Id