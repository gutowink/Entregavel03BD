DROP TABLE funcionario;

DROP TABLE gestor;

CREATE TABLE funcionario
(
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    gestorid VARCHAR(20),
    cargo VARCHAR(30) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    nome_completo VARCHAR(100) NOT NULL,
    FOREIGN KEY (gestorid) REFERENCES funcionario(codigo)
);

-- prompt chatGPT: 10 inserts para funcionários, 1 sem gestor.

INSERT INTO funcionario (cargo, departamento, nome_completo, gestorid)
VALUES
     ('Presidente', 'Administração', 'Carlos Silva', NULL),
     ('Gerente', 'Vendas', 'Ana Souza', 1),
     ('Gerente', 'RH', 'Bruno Almeida', 1),
     ('Supervisor', 'Vendas', 'Mariana Lima', 2),
     ('Supervisor', 'RH', 'Ricardo Santos', 3),
     ('Analista', 'Vendas', 'Luísa Carvalho', 4),
     ('Analista', 'RH', 'Patrícia Duarte', 5),
     ('Assistente', 'Vendas', 'Pedro Gonçalves', 6),
     ('Assistente', 'RH', 'Joana Costa', 7),
     ('Assistente', 'Vendas', 'Gustavo Ferreira', 6),
     ('Assistente', 'RH', 'Lívia Mendes', 7);

CREATE TABLE categoria
(
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    categoria VARCHAR(50) NOT NULL
);

INSERT INTO categoria(categoria)
VALUES
    ('Seguros'),
    ('Contas'),
    ('Financiamentos'),
    ('Empréstimos');

DROP TABLE meta;

CREATE TABLE meta
(
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    categoria_id VARCHAR(50) NOT NULL,
    funcionarioid VARCHAR(20),
    meta INTEGER NOT NULL,
    quantidade_vendida INTEGER NOT NULL DEFAULT 0,
    data DATE NOT NULL,
    FOREIGN KEY (funcionarioid) REFERENCES funcionario(codigo),
    FOREIGN KEY (categoria_id) REFERENCES categoria(codigo)
);

-- prompt chatGPT:  Inserção de dados na tabela meta: 4 metas por funcionário, uma para cada categoria

INSERT INTO meta (categoria_id, funcionarioid, meta, quantidade_vendida, data)
VALUES
    -- Metas para o funcionário 4 (Luísa Carvalho - Vendas)
    (1, 4, 100, 80, '2024-10-01'),
    (2, 4, 150, 120, '2024-09-15'),
    (3, 4, 200, 190, '2024-10-10'),
    (4, 4, 180, 175, '2024-09-25'),

    -- Metas para o funcionário 5 (Ricardo Santos - RH)
    (1, 5, 90, 85, '2024-09-20'),
    (2, 5, 130, 110, '2024-10-05'),
    (3, 5, 180, 160, '2024-09-25'),
    (4, 5, 120, 115, '2024-08-30'),

    -- Metas para o funcionário 6 (Mariana Lima - Vendas)
    (1, 6, 120, 100, '2024-08-15'),
    (2, 6, 140, 130, '2024-07-30'),
    (3, 6, 160, 150, '2024-09-10'),
    (4, 6, 130, 125, '2024-09-22'),

    -- Metas para o funcionário 7 (Patrícia Duarte - RH)
    (1, 7, 100, 95, '2024-08-25'),
    (2, 7, 110, 105, '2024-09-15'),
    (3, 7, 130, 125, '2024-10-01'),
    (4, 7, 140, 135, '2024-09-18');

-- Metas para o funcionário 1 (Carlos Silva - Presidente)
INSERT INTO meta (categoria_id, funcionarioid, meta, quantidade_vendida, data)
VALUES
    (1, 1, 200, 180, '2024-09-05'),
    (2, 1, 220, 210, '2024-08-10'),
    (3, 1, 250, 240, '2024-10-02'),
    (4, 1, 260, 250, '2024-09-30'),

    -- Metas para o funcionário 2 (Ana Souza - Gerente de Vendas)
    (1, 2, 180, 170, '2024-09-15'),
    (2, 2, 200, 190, '2024-09-25'),
    (3, 2, 210, 200, '2024-08-20'),
    (4, 2, 220, 210, '2024-07-10'),

    -- Metas para o funcionário 3 (Bruno Almeida - Gerente de RH)
    (1, 3, 160, 155, '2024-09-05'),
    (2, 3, 180, 175, '2024-08-15'),
    (3, 3, 190, 185, '2024-09-10'),
    (4, 3, 200, 195, '2024-08-05'),

    -- Metas para o funcionário 8 (Pedro Gonçalves - Assistente de Vendas)
    (1, 8, 120, 110, '2024-09-12'),
    (2, 8, 130, 120, '2024-08-18'),
    (3, 8, 140, 130, '2024-10-01'),
    (4, 8, 150, 140, '2024-09-05'),

    -- Metas para o funcionário 9 (Joana Costa - Assistente de RH)
    (1, 9, 110, 105, '2024-07-15'),
    (2, 9, 120, 115, '2024-08-20'),
    (3, 9, 130, 125, '2024-09-25'),
    (4, 9, 140, 135, '2024-10-01'),

    -- Metas para o funcionário 10 (Gustavo Ferreira - Assistente de Vendas)
    (1, 10, 130, 120, '2024-09-01'),
    (2, 10, 140, 130, '2024-08-25'),
    (3, 10, 150, 140, '2024-07-30'),
    (4, 10, 160, 150, '2024-09-12');

--prompt chatGPT: 10 inserts da tabela avaliacao

INSERT INTO avaliacao (nota, data_avaliacao, gestorid, funcionarioid)
VALUES
    (85, '2024-01-15', 1, 2),
    (92, '2024-01-20', 1, 3),
    (78, '2024-02-10', 2, 4),
    (88, '2024-02-15', 3, 5),
    (67, '2024-03-05', 4, 6),
    (73, '2024-03-10', 5, 7),
    (80, '2024-04-01', 6, 8),
    (95, '2024-04-05', 7, 9),
    (76, '2024-04-10', 6, 10),
    (82, '2024-04-15', 7, 11);
