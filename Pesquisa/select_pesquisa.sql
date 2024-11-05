
-- Consulte a nota média de cada produto (sobre a média das questões) para cada uma das pesquisas.
-- Liste o título e a data da pesquisa, seguido dos produtos e suas médias
SELECT p.titulo AS TituloPesquisa,
       p.data AS DataPesquisa,
       prod.nome AS Produto,
       AVG(r.resposta) AS MediaNota
FROM pesquisa p
         JOIN respostas r ON p.id = r.pesquisa_id
         JOIN responde res ON r.id = res.respostasid
         JOIN produtos prod ON res.produtosid = prod.sku
GROUP BY p.id, p.titulo, p.data, prod.nome
ORDER BY p.data, prod.nome;

-- Para cada produto, mostre a variação da nota média de uma pesquisa para outra
SELECT p.nome AS Nome,
       AVG(r.resposta)
FROM produtos p
JOIN respostas r ON p.respostaid = r.id
GROUP BY p.nome;






