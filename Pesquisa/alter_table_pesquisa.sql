
-- prompt chatGPT: faça 2 inserts para perguntas com resposta livre.

INSERT INTO produtos (sku, nome, data_lancamento) VALUES
        ('PROD016', 'Produto P', '2024-01-16'),
        ('PROD017', 'Produto Q', '2024-01-17'),
        ('PROD018', 'Produto R', '2024-01-18'),
        ('PROD019', 'Produto S', '2024-01-19'),
        ('PROD020', 'Produto T', '2024-01-20');

INSERT INTO perguntas (pergunta, alternativas) VALUES
        ('O que você mais gostou no Produto A?', 'Resposta livre'),
        ('O que você gostaria de melhorar no Produto B?', 'Resposta livre');

CREATE TABLE pesquisa
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo VARCHAR(50) NOT NULL,
    data DATE NOT NULL
);

-- prompt chatGPT: faça 3 inserts para a tabela pesquisa

INSERT INTO pesquisa (titulo, data) VALUES
        ('Pesquisa de Satisfação sobre Produtos', '2024-01-20'),
        ('Avaliação dos Produtos Lançados', '2024-01-21'),
        ('Feedback dos Clientes sobre o Produto A', '2024-01-22');

DROP TABLE respostas;
DROP TABLE perguntas;

CREATE TABLE respostas
(
    id VARCHAR(50) PRIMARY KEY,
    resp_texto TEXT,
    resposta INTEGER,
    pesquisa_id INTEGER,
    FOREIGN KEY (pesquisa_id) REFERENCES pesquisa(id)
);

CREATE TABLE perguntas
(
    pergunta TEXT PRIMARY KEY,
    alternativas TEXT NOT NULL,
    pesquisa_id INTEGER,
    FOREIGN KEY (pesquisa_id) REFERENCES pesquisa(id)
);

-- prompt chatGPT: faça 15 inserts para as tabelas respostas e perguntas

INSERT INTO respostas (id, resposta, pesquisa_id) VALUES
        ('RESP001', 1, 1),
        ('RESP002', 2, 1),
        ('RESP003', 3, 2),
        ('RESP004', 4, 2),
        ('RESP005', 1, 3),
        ('RESP006', 2, 3),
        ('RESP007', 3, 1),
        ('RESP008', 4, 1),
        ('RESP009', 1, 2),
        ('RESP010', 2, 2),
        ('RESP011', 3, 3),
        ('RESP012', 4, 3),
        ('RESP013', 1, 1),
        ('RESP014', 2, 2),
        ('RESP015', 3, 3);


INSERT INTO perguntas (pergunta, alternativas, pesquisa_id) VALUES
        ('Qual é sua opinião sobre o Produto A?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 1),
        ('Qual é sua opinião sobre o Produto B?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 1),
        ('Qual é sua opinião sobre o Produto C?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 2),
        ('Qual é sua opinião sobre o Produto D?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 2),
        ('Qual é sua opinião sobre o Produto E?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 3),
        ('Qual é sua opinião sobre o Produto F?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 3),
        ('Qual é sua opinião sobre o Produto G?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 1),
        ('Qual é sua opinião sobre o Produto H?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 1),
        ('Qual é sua opinião sobre o Produto I?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 2),
        ('Qual é sua opinião sobre o Produto J?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 2),
        ('Qual é sua opinião sobre o Produto K?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 3),
        ('Qual é sua opinião sobre o Produto L?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 3),
        ('Qual é sua opinião sobre o Produto M?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 1),
        ('Qual é sua opinião sobre o Produto N?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 2),
        ('Qual é sua opinião sobre o Produto O?', '1. Ótimo | 2. Bom | 3. Regular | 4. Ruim', 3);

DROP TABLE produtos;

CREATE TABLE produtos
(
    sku VARCHAR(30) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    data_lancamento DATE NOT NULL,
    respostaid VARCHAR(20),
    FOREIGN KEY (respostaid) REFERENCES respostas(id)
);

-- prompt chatGPT: faça 15 inserts para a tabela produtos

INSERT INTO produtos (sku, nome, data_lancamento, respostaid) VALUES
      ('PROD001', 'Produto A', '2024-01-01', 'RESP001'),
      ('PROD002', 'Produto B', '2024-01-02', 'RESP002'),
      ('PROD003', 'Produto C', '2024-01-03', 'RESP003'),
      ('PROD004', 'Produto D', '2024-01-04', 'RESP004'),
      ('PROD005', 'Produto E', '2024-01-05', 'RESP005'),
      ('PROD006', 'Produto F', '2024-01-06', 'RESP006'),
      ('PROD007', 'Produto G', '2024-01-07', 'RESP007'),
      ('PROD008', 'Produto H', '2024-01-08', 'RESP008'),
      ('PROD009', 'Produto I', '2024-01-09', 'RESP009'),
      ('PROD010', 'Produto J', '2024-01-10', 'RESP010'),
      ('PROD011', 'Produto K', '2024-01-11', 'RESP011'),
      ('PROD012', 'Produto L', '2024-01-12', 'RESP012'),
      ('PROD013', 'Produto M', '2024-01-13', 'RESP013'),
      ('PROD014', 'Produto N', '2024-01-14', 'RESP014'),
      ('PROD015', 'Produto O', '2024-01-15', 'RESP015');
