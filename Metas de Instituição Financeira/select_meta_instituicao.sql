
-- Liste os funcionários que atingiram ou ultrapassaram 100% das metas em TODAS as categorias
SELECT f.nome_completo
FROM funcionario f
JOIN meta m ON f.codigo = m.funcionarioid
GROUP BY f.codigo
HAVING SUM(m.quantidade_vendida) >= SUM(m.meta);

-- Calcular a média de vendas realizadas em cada categoria (seguros, contas, financiamentos, e empréstimos),
-- identificando as categorias com melhor e pior desempenho – traga em uma nova coluna o texto
-- “Melhor” e “Pior” para a categoria correspondente, demais trarão “Mediano”
CREATE VIEW vendasPorCategoria AS
SELECT c.categoria,
    AVG(m.quantidade_vendida) AS media_vendas
FROM meta m
JOIN categoria c ON m.categoria_id = c.codigo
GROUP BY c.codigo;

SELECT categoria, media_vendas,
    CASE
        WHEN media_vendas = (SELECT MAX(media_vendas) FROM VendasPorCategoria) THEN 'Melhor'
        WHEN media_vendas = (SELECT MIN(media_vendas) FROM VendasPorCategoria) THEN 'Pior'
        ELSE 'Mediano'
    END AS desempenho
FROM VendasPorCategoria
ORDER BY media_vendas DESC;

--Calcule a média das notas finais de avaliação para cada equipe (agrupando os funcionários pelo gestor)
-- e verificando quais equipes estão com melhor desempenho geral
SELECT (SELECT nome_completo FROM funcionario WHERE codigo = f.gestorid) AS Gestor,
       AVG(a.nota) AS MediaEquipe
FROM funcionario f
JOIN avaliacao a ON f.codigo = a.funcionarioid
GROUP BY f.gestorid
ORDER BY MediaEquipe DESC;

-- Listar todos os funcionários que não atingiram suas metas em uma ou mais categorias, destacando a quantidade
-- que faltou para cada categoria onde a meta não foi atingida
SELECT c.categoria,
       f.nome_completo AS Nome,
       m.quantidade_vendida AS QuantidadeVendida,
       m.meta - m.quantidade_vendida AS QuantoFaltouParaBaterAMeta
FROM funcionario f
JOIN meta m ON f.codigo = m.funcionarioid
JOIN categoria c ON c.codigo = m.categoria_id
WHERE quantidade_vendida < meta;

-- Crie uma pergunta/insight não listado aqui. Faça a consulta para respondê-la
-- Pergunta: Liste os funcionários e quem é seu gestor e suas respectivas notas.
SELECT f.nome_completo,
       g.nome_completo AS Gestor,
       a.nota
FROM funcionario f
JOIN avaliacao a ON f.codigo = a.funcionarioid
LEFT JOIN funcionario g ON f.gestorid = g.codigo
WHERE f.gestorid IS NOT NULL;
