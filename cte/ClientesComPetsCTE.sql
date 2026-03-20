with ClientesComPetsCTE as (
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
)
select * from ClientesComPetsCTE;
