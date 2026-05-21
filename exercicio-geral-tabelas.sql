-- 1
select Nome, Email
from Usuario
where Ativo = true

-- 2
select Id, DataPedido, ValorTotal
from Pedido
where ValorTotal > 500

-- 3
select u.Nome, p.ValorTotal
from Pedido p
inner join Usuario u
on p.UsuarioId = u.Id

-- 4
select count(*) as TotalUsuarios
from Usuario
where Email like '%gmail.com'

-- 5
select max(ValorTotal)
from Pedido

-- 6 Calcular a media de valor dos pedidos
-- feitos somente por usuarios ativos
select avg(ValorTotal)
from Pedido p
inner join Usuario u
on p.usuarioid = u.id
where u.Ativo = true

-- 7 Calcular o valor total de todos os pedidos
-- feito em PIX, ignorando letras maiusculas e minusculas
select sum(ValorTotal)
from Pedido p
inner join FormaPagamento f
on p.formaPagamentoId = f.Id
where f.Nome ilike '%Pix%'

-- 8 
select u.Nome, 
p.DataPedido, 
s.Nome as Status
from Pedido p
inner join Usuario u
on u.Id = p.UsuarioId
inner join Status s
on p.StatusId = s.Id
where p.StatusId = 2

-- 9
select u.Nome as NomeUsuario, 
p.ValorTotal,
fp.Nome as FormaPagamento
from Pedido p
inner join Usuario u
on p.UsuarioId = u.Id
inner join FormaPagamento fp
on p.FormaPagamentoId = fp.Id
where fp.Nome ilike '%Cartão%'
-- where fp.Id = 1 or fp.Id = 2

-- 10
select u.Nome as NomeUsuario,
p.DataPedido,
p.ValorTotal
from Pedido p
inner join Usuario u
on P.UsuarioId = u.Id
where ValorTotal > 700

-- 11
select distinct p.UsuarioId,
u.Nome
from Pedido p
inner join Usuario u
on p.UsuarioId = u.Id
where Ativo = true

-- 12
select Usuario.Nome,
Status.Nome as Status,
Pedido.Observacao
from Pedido 
inner join Usuario
on Pedido.UsuarioId = Usuario.Id
inner join Status
on Pedido.StatusId = Status.Id
where Pedido.Observacao is not null

-- 13
update usuario
set Email = 'oliveira.maria@gmail.com',
	Telefone = '(51) 99922-6385'
where Id = 2