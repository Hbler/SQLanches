-- Creating queries

-- Querying orders with product info)
SELECT
	*
FROM
	pedidos pe
JOIN
	produtos_pedidos pp ON pe.id = pp.pedido_id
JOIN
	produtos pr ON pr.id = pp.produto_id;
-- Querying orders that include 'Fritas')
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
-- Querying the name of clients that ordered 'Fritas' with custom column header 'gostam_de_fritas')
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
-- Querying the total price of Laura's orders)
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
-- Querying products and how many times each was ordered)
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