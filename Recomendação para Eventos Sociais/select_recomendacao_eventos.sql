
-- Liste todos os eventos cadastrados, ordenados pela data (mais próximo primeiro) e suas respectivas categorias
SELECT e.nome AS Nome,
       c.nome Categoria,
       e.data DataEvento
FROM evento e
LEFT JOIN categoria c ON e.categoriaid = c.id
ORDER BY data;

-- Liste os eventos que ao menos uma pessoa marcou como “Eu vou”
SELECT e.nome
FROM evento e
JOIN participa p ON e.id = p.eventoid
JOIN usuario u ON p.usuarioid = u.cpf
WHERE p.status = 'confirmado';

-- Determine quais categorias de eventos têm o maior número de usuários interessados. Esse insight permite
-- que a empresa entenda as preferências gerais dos usuários para otimizar a criação e a promoção de eventos
SELECT c.nome AS Categoria,
       COUNT(i.usuarioid) AS PessoasInteressadas
FROM interesse i
JOIN usuario u ON i.usuarioid = u.cpf
JOIN categoria c on i.categoriaid = c.id
GROUP BY c.nome
ORDER BY PessoasInteressadas DESC;

-- Selecione as categorias que não possuem interesse dos clientes nem eventos
SELECT c.nome
FROM categoria c
LEFT JOIN interesse i ON c.id = i.categoriaid
LEFT JOIN evento e ON c.id = e.categoriaid
WHERE i.usuarioid IS NULL AND e.id IS NULL;

-- Liste as mensagens trocadas por clientes que vão em um evento, no formato: Nome do Evento,
-- Autor da Mensagem, Destinatário, Data, Conteúdo da Mensagem. Atente para o fato que uma
-- troca de mensagens foi inserida: ao menos duas linhas precisam ser mostradas, com a
-- mensagem de cada autor.
SELECT e.nome AS Evento,
       u.nome AS Autor,
       b.nome AS Destinatario,
       m.data_envio AS Data,
       m.mensagem AS Mensagem
FROM evento e
LEFT JOIN mensagem m ON e.id = m.eventoid
LEFT JOIN usuario u ON m.autor = u.cpf
LEFT JOIN usuario b ON m.destinatario = b.cpf
WHERE u.nome IS NOT NULL
GROUP BY u.nome;

-- Analise o engajamento em eventos por faixa etária, identificando quais grupos demográficos
-- (ex., jovens adultos, adultos, idosos) são mais propensos a se inscrever e participar dos eventos

