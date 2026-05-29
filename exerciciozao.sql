-- 1. Mostrar pedidos com valor entre 100 e 500 
select * from pedido 
where valortotal between 100 and 500

-- 2. Contar quantos usuários que usam outlook existem cadastrados 
select count(*) as TotalUsuarios
from usuario
where email like '%outlook%'

-- 3. Mostrar os dados do pedido de maior valor 
select *
from pedido
order by valortotal desc
limit 1

-- 4. Mostrar os dados do produto de menor preço 
select *
from produto
order by preco asc
limit 1

-- 5. Mostrar a média de preço dos produtos apenas dos produtos que saíram em pedidos
select avg(preco)
from produto
where id in (select distinct produtoid from pedidoproduto)

-- 6. Listar dados do pedido, usuário e produto apenas dos pedidos acima de 300 reais
select
ped.id as idpedido,
ped.datapedido,
ped.valortotal,
u.nome as nomeusuario,
prod.nome as nomeproduto,
pp.quantidade,
pp.valorunitario,
pp.valortotal as valorTotalProduto
from pedidoproduto pp
inner join produto prod
on prod.id = pp.produtoid
inner join pedido ped
on ped.id = pp.pedidoid
inner join usuario u
on u.id = ped.usuarioid
where ped.valortotal > 300


-- 7. Mostrar o nome do usuario, cidade e estado de usuários inativos
select u.nome as nomeusuario, c.nome as nomecidade, c.estado
from usuario u
inner join cidade c
on c.id = u.cidadeid
where u.ativo = false


-- 8. Suba o preco do ‘Mouse Gamer’ e do ‘Mousepad XXL’ em 15%
update produto
set preco = preco * 1.15
where id in (select id from produto where nome in ('Mouse Gamer', 'Mousepad XXL'))

-- 9. Mostrar quantidade total de pedidos por usuário 
select count(p.id) as quantidadePedido, u.nome as nomeusuario
from pedido p 
inner join usuario u
on u.id = p.usuarioid
group by u.id


-- 10. Mostrar valor total vendido por produto 
select prod.id as idproduto, prod.nome as nomeproduto, sum(pp.valortotal)
from pedidoproduto pp
inner join produto prod
on prod.id = pp.produtoid
group by prod.id


-- 11. Mostrar usuários que fizeram pedidos acima do valor médio
select distinct u.id, u.nome
from usuario u
inner join pedido p 
on p.usuarioid = u.id
where p.valortotal > (select avg(valortotal) from pedido)


-- 12. Mostrar produtos com preço acima da média dos produtos
select *
from produto
where preco > (select avg(preco) from produto)