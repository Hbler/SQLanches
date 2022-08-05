-- Seleções de dados

-- 1)
SELECT
	*
FROM
	pedidos pe
JOIN
	produtos_pedidos pp ON pe.id = pp.pedido_id
JOIN
	produtos pr ON pr.id = pp.produto_id;
-- 2)
SELECT
	pe.id id_pedido
FROM
	pedidos pe
JOIN
	produtos_pedidos pp ON pe.id = pp.pedido_id
JOIN
	produtos pr ON pr.id = pp.produto_id
WHERE
	pr.nome ILIKE 'fritas';
-- 3)
SELECT
	cl.nome gostam_de_fritas
FROM
	clientes cl
JOIN
	pedidos pe ON cl.id = pe.cliente_id
JOIN
	produtos_pedidos pp ON pe.id = pp.pedido_id
JOIN
	produtos pr ON pr.id = pp.produto_id
WHERE
	pr.nome ILIKE 'fritas';
-- 4)
SELECT
	SUM(pr.preco) total_pedidos_laura
FROM
	produtos pr
JOIN
	produtos_pedidos pp ON pr.id = pp.produto_id
JOIN
	pedidos pe ON pe.id = pp.pedido_id
JOIN
	clientes cl ON cl.id = pe.cliente_id
WHERE
	cl.nome ILIKE 'laura';
-- 5)
SELECT
	pr.nome produto, COUNT(pp.produto_id) vezes_pedido
FROM
	produtos pr
JOIN
	produtos_pedidos pp ON pr.id = pp.produto_id
JOIN
	pedidos pe ON pe.id = pp.pedido_id
GROUP BY
	pr.nome
ORDER BY COUNT(pp.produto_id);