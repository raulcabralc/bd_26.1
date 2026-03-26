create materialized view VwmClientesPets as (
	with ClientesComPets as (
	select
		c.id,
		c.nome,
		c.telefone,
		c.email,
		count(p.id) as qtd_pets,
		p.nome as pet
	from clientes c
	join pets p
		on c.id = p.cliente_id
	group by c.id, c.nome, c.telefone, c.email, p.nome
	),
	ClientesCompras as (
		select
			cliente_id,
			count(*) as qtd_compras,
			sum(valor_total) as total
		from vendas v
		group by cliente_id
	)
	select *
	from ClientesComPets ccp
	join ClientesCompras cc
	on ccp.id = cc.cliente_id
)

select * from vwmclientespets v
