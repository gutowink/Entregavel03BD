CREATE TABLE clientes
(
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    telefone VARCHAR(30) NOT NULL,
    rua VARCHAR(10) NOT NULL,
    numero INTEGER NOT NULL
);

CREATE TABLE produtos
(
    sku VARCHAR(26) NOT NULL,
    quantidade INTEGER NOT NULL,
    nome VARCHAR(30) NOT NULL,
    preco INTEGER NOT NULL,
    prateleira VARCHAR(30) NOT NULL
);

CREATE TABLE venda
(
    clientesid VARCHAR(14),
    produtosid VARCHAR(26),
    PRIMARY KEY (clientesid, produtosid),
    FOREIGN KEY (clientesid) REFERENCES clientes(cpf),
    FOREIGN KEY (produtosid) REFERENCES produtos(sku)
);

CREATE TABLE comerciantes
(
    cnpj VARCHAR(30) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE fornece
(
    comerciantesid VARCHAR(30),
    produtosid VARCHAR(26),
    PRIMARY KEY (comerciantesid, produtosid),
    FOREIGN KEY (comerciantesid) REFERENCES comerciantes(cnpj),
    FOREIGN KEY (produtosid) REFERENCES produtos(sku)
);

INSERT INTO clientes (cpf, nome, sobrenome, telefone, rua, numero) VALUES
        ('111.111.111-11', 'João', 'Silva', '99999-1111', 'Rua A', 100),
        ('222.222.222-22', 'Maria', 'Oliveira', '99999-2222', 'Rua B', 200),
        ('333.333.333-33', 'José', 'Santos', '99999-3333', 'Rua C', 300),
        ('444.444.444-44', 'Ana', 'Pereira', '99999-4444', 'Rua D', 400),
        ('555.555.555-55', 'Carlos', 'Costa', '99999-5555', 'Rua E', 500),
        ('666.666.666-66', 'Paula', 'Martins', '99999-6666', 'Rua F', 600),
        ('777.777.777-77', 'Pedro', 'Rocha', '99999-7777', 'Rua G', 700),
        ('888.888.888-88', 'Lucas', 'Ferreira', '99999-8888', 'Rua H', 800),
        ('999.999.999-99', 'Juliana', 'Carvalho', '99999-9999', 'Rua I', 900),
        ('123.123.123-12', 'Fernanda', 'Ramos', '99999-1010', 'Rua J', 1000),
        ('321.321.321-32', 'Gabriel', 'Alves', '99999-1111', 'Rua K', 1100),
        ('456.456.456-45', 'Rafael', 'Mendes', '99999-1212', 'Rua L', 1200),
        ('654.654.654-65', 'Sofia', 'Barbosa', '99999-1313', 'Rua M', 1300),
        ('789.789.789-78', 'Ricardo', 'Lima', '99999-1414', 'Rua N', 1400),
        ('987.987.987-98', 'Luana', 'Souza', '99999-1515', 'Rua O', 1500);

INSERT INTO produtos (sku, quantidade, nome, preco, prateleira) VALUES
        ('SKU001', 10, 'Produto A', 1000, 'Prateleira 1'),
        ('SKU002', 15, 'Produto B', 1500, 'Prateleira 2'),
        ('SKU003', 20, 'Produto C', 2000, 'Prateleira 3'),
        ('SKU004', 25, 'Produto D', 2500, 'Prateleira 4'),
        ('SKU005', 30, 'Produto E', 3000, 'Prateleira 5'),
        ('SKU006', 35, 'Produto F', 3500, 'Prateleira 6'),
        ('SKU007', 40, 'Produto G', 4000, 'Prateleira 7'),
        ('SKU008', 45, 'Produto H', 4500, 'Prateleira 8'),
        ('SKU009', 50, 'Produto I', 5000, 'Prateleira 9'),
        ('SKU010', 55, 'Produto J', 5500, 'Prateleira 10'),
        ('SKU011', 60, 'Produto K', 6000, 'Prateleira 11'),
        ('SKU012', 65, 'Produto L', 6500, 'Prateleira 12'),
        ('SKU013', 70, 'Produto M', 7000, 'Prateleira 13'),
        ('SKU014', 75, 'Produto N', 7500, 'Prateleira 14'),
        ('SKU015', 80, 'Produto O', 8000, 'Prateleira 15');

INSERT INTO venda (clientesid, produtosid) VALUES
        ('111.111.111-11', 'SKU001'),
        ('222.222.222-22', 'SKU002'),
        ('333.333.333-33', 'SKU003'),
        ('444.444.444-44', 'SKU004'),
        ('555.555.555-55', 'SKU005'),
        ('666.666.666-66', 'SKU006'),
        ('777.777.777-77', 'SKU007'),
        ('888.888.888-88', 'SKU008'),
        ('999.999.999-99', 'SKU009'),
        ('123.123.123-12', 'SKU010'),
        ('321.321.321-32', 'SKU011'),
        ('456.456.456-45', 'SKU012'),
        ('654.654.654-65', 'SKU013'),
        ('789.789.789-78', 'SKU014'),
        ('987.987.987-98', 'SKU015');

INSERT INTO comerciantes (cnpj, nome) VALUES
        ('CNPJ001', 'Comerciante A'),
        ('CNPJ002', 'Comerciante B'),
        ('CNPJ003', 'Comerciante C'),
        ('CNPJ004', 'Comerciante D'),
        ('CNPJ005', 'Comerciante E'),
        ('CNPJ006', 'Comerciante F'),
        ('CNPJ007', 'Comerciante G'),
        ('CNPJ008', 'Comerciante H'),
        ('CNPJ009', 'Comerciante I'),
        ('CNPJ010', 'Comerciante J'),
        ('CNPJ011', 'Comerciante K'),
        ('CNPJ012', 'Comerciante L'),
        ('CNPJ013', 'Comerciante M'),
        ('CNPJ014', 'Comerciante N'),
        ('CNPJ015', 'Comerciante O');

INSERT INTO fornece (comerciantesid, produtosid) VALUES
        ('CNPJ001', 'SKU001'),
        ('CNPJ002', 'SKU002'),
        ('CNPJ003', 'SKU003'),
        ('CNPJ004', 'SKU004'),
        ('CNPJ005', 'SKU005'),
        ('CNPJ006', 'SKU006'),
        ('CNPJ007', 'SKU007'),
        ('CNPJ008', 'SKU008'),
        ('CNPJ009', 'SKU009'),
        ('CNPJ010', 'SKU010'),
        ('CNPJ011', 'SKU011'),
        ('CNPJ012', 'SKU012'),
        ('CNPJ013', 'SKU013'),
        ('CNPJ014', 'SKU014'),
        ('CNPJ015', 'SKU015');
