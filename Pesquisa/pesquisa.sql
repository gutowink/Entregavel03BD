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
