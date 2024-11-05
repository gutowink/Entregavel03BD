
-- prompt chatGPT: faça 5 inserts para a tabela produtos e 2 perguntas com resposta livre.

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
    id VARCHAR(15) PRIMARY KEY,
    resp_texto TEXT NOT NULL,
    resp_likert VARCHAR(1) NOT NULL,
    pesquisa_id INTEGER,
    FOREIGN KEY (pesquisa_id) REFERENCES pesquisa(id)
);

CREATE TABLE perguntas
(
    pergunta TEXT PRIMARY KEY,
    alternativas VARCHAR(50) NOT NULL,
    pesquisa_id INTEGER,
    FOREIGN KEY (pesquisa_id) REFERENCES pesquisa(id)
);

-- prompt chatGPT: faça 15 inserts para as tabelas respostas e perguntas

INSERT INTO respostas (id, resp_texto, resp_likert, pesquisa_id) VALUES
        ('RESP001', 'Resposta para pergunta 1', 'A', 1),
        ('RESP002', 'Resposta para pergunta 2', 'B', 1),
        ('RESP003', 'Resposta para pergunta 3', 'C', 2),
        ('RESP004', 'Resposta para pergunta 4', 'D', 2),
        ('RESP005', 'Resposta para pergunta 5', 'A', 3),
        ('RESP006', 'Resposta para pergunta 6', 'B', 3),
        ('RESP007', 'Resposta para pergunta 7', 'C', 1),
        ('RESP008', 'Resposta para pergunta 8', 'D', 1),
        ('RESP009', 'Resposta para pergunta 9', 'A', 2),
        ('RESP010', 'Resposta para pergunta 10', 'B', 2),
        ('RESP011', 'Resposta para pergunta 11', 'C', 3),
        ('RESP012', 'Resposta para pergunta 12', 'D', 3),
        ('RESP013', 'Resposta para pergunta 13', 'A', 1),
        ('RESP014', 'Resposta para pergunta 14', 'B', 2),
        ('RESP015', 'Resposta para pergunta 15', 'C', 3);

INSERT INTO perguntas (pergunta, alternativas, pesquisa_id) VALUES
        ('Qual é sua opinião sobre o Produto A?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 1),
        ('Qual é sua opinião sobre o Produto B?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 1),
        ('Qual é sua opinião sobre o Produto C?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 2),
        ('Qual é sua opinião sobre o Produto D?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 2),
        ('Qual é sua opinião sobre o Produto E?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 3),
        ('Qual é sua opinião sobre o Produto F?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 3),
        ('Qual é sua opinião sobre o Produto G?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 1),
        ('Qual é sua opinião sobre o Produto H?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 1),
        ('Qual é sua opinião sobre o Produto I?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 2),
        ('Qual é sua opinião sobre o Produto J?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 2),
        ('Qual é sua opinião sobre o Produto K?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 3),
        ('Qual é sua opinião sobre o Produto L?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 3),
        ('Qual é sua opinião sobre o Produto M?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 1),
        ('Qual é sua opinião sobre o Produto N?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 2),
        ('Qual é sua opinião sobre o Produto O?', 'A. Ótimo | B. Bom | C. Regular | D. Ruim', 3);
