CREATE TABLE produtos
(
    sku VARCHAR(30) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    data_lancamento DATE NOT NULL
);

CREATE TABLE respostas
(
    id VARCHAR(15) PRIMARY KEY,
    resp_texto TEXT NOT NULL,
    resp_likert VARCHAR(1) NOT NULL
);

CREATE TABLE perguntas
(
    pergunta TEXT PRIMARY KEY,
    alternativas VARCHAR(50) NOT NULL
);

CREATE TABLE cadastros
(
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    data_nascimento DATE NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numer VARCHAR(30) NOT NULL
);

CREATE TABLE responde
(
    produtosid VARCHAR(30),
    respostasid VARCHAR(15),
    cadastrosid VARCHAR(14),
    PRIMARY KEY (produtosid, respostasid, cadastrosid),
    FOREIGN KEY (produtosid) REFERENCES produtos(sku),
    FOREIGN KEY (respostasid) REFERENCES respostas(id),
    FOREIGN KEY (cadastrosid) REFERENCES cadastros(cpf)
);

INSERT INTO produtos (sku, nome, data_lancamento) VALUES
        ('PROD001', 'Produto A', '2024-01-01'),
        ('PROD002', 'Produto B', '2024-01-02'),
        ('PROD003', 'Produto C', '2024-01-03'),
        ('PROD004', 'Produto D', '2024-01-04'),
        ('PROD005', 'Produto E', '2024-01-05'),
        ('PROD006', 'Produto F', '2024-01-06'),
        ('PROD007', 'Produto G', '2024-01-07'),
        ('PROD008', 'Produto H', '2024-01-08'),
        ('PROD009', 'Produto I', '2024-01-09'),
        ('PROD010', 'Produto J', '2024-01-10'),
        ('PROD011', 'Produto K', '2024-01-11'),
        ('PROD012', 'Produto L', '2024-01-12'),
        ('PROD013', 'Produto M', '2024-01-13'),
        ('PROD014', 'Produto N', '2024-01-14'),
        ('PROD015', 'Produto O', '2024-01-15');

INSERT INTO cadastros (cpf, nome, sobrenome, data_nascimento, rua, numer) VALUES
        ('111.111.111-11', 'João', 'Silva', '1990-01-01', 'Rua A', '100'),
        ('222.222.222-22', 'Maria', 'Oliveira', '1991-02-02', 'Rua B', '200'),
        ('333.333.333-33', 'José', 'Santos', '1992-03-03', 'Rua C', '300'),
        ('444.444.444-44', 'Ana', 'Pereira', '1993-04-04', 'Rua D', '400'),
        ('555.555.555-55', 'Carlos', 'Costa', '1994-05-05', 'Rua E', '500'),
        ('666.666.666-66', 'Paula', 'Martins', '1995-06-06', 'Rua F', '600'),
        ('777.777.777-77', 'Pedro', 'Rocha', '1996-07-07', 'Rua G', '700'),
        ('888.888.888-88', 'Lucas', 'Ferreira', '1997-08-08', 'Rua H', '800'),
        ('999.999.999-99', 'Juliana', 'Carvalho', '1998-09-09', 'Rua I', '900'),
        ('123.123.123-12', 'Fernanda', 'Ramos', '1999-10-10', 'Rua J', '1000'),
        ('321.321.321-32', 'Gabriel', 'Alves', '1988-11-11', 'Rua K', '1100'),
        ('456.456.456-45', 'Rafael', 'Mendes', '1987-12-12', 'Rua L', '1200'),
        ('654.654.654-65', 'Sofia', 'Barbosa', '1986-01-13', 'Rua M', '1300'),
        ('789.789.789-78', 'Ricardo', 'Lima', '1985-02-14', 'Rua N', '1400'),
        ('987.987.987-98', 'Luana', 'Souza', '1984-03-15', 'Rua O', '1500');

INSERT INTO responde (produtosid, respostasid, cadastrosid) VALUES
        ('PROD001', 'RESP001', '111.111.111-11'),
        ('PROD002', 'RESP002', '222.222.222-22'),
        ('PROD003', 'RESP003', '333.333.333-33'),
        ('PROD004', 'RESP004', '444.444.444-44'),
        ('PROD005', 'RESP005', '555.555.555-55'),
        ('PROD006', 'RESP006', '666.666.666-66'),
        ('PROD007', 'RESP007', '777.777.777-77'),
        ('PROD008', 'RESP008', '888.888.888-88'),
        ('PROD009', 'RESP009', '999.999.999-99'),
        ('PROD010', 'RESP010', '123.123.123-12'),
        ('PROD011', 'RESP011', '321.321.321-32'),
        ('PROD012', 'RESP012', '456.456.456-45'),
        ('PROD013', 'RESP013', '654.654.654-65'),
        ('PROD014', 'RESP014', '789.789.789-78'),
        ('PROD015', 'RESP015', '987.987.987-98');

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
