CREATE TABLE categorias
(
    id VARCHAR(30) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE produto
(
    sku VARCHAR(30) PRIMARY KEY,
    descricao TEXT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    quantidade INTEGER NOT NULL,
    cateogirasid VARCHAR(30),
    FOREIGN KEY (cateogirasid) REFERENCES categorias(id)
);

CREATE TABLE clientes
(
    cpf VARCHAR(14) PRIMARY KEY,
    rua VARCHAR(30) NOT NULL,
    numero VARCHAR(30) NOT NULL,
    telefone VARCHAR(35) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE funcionario
(
    matricula VARCHAR(30) PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL
);

CREATE TABLE venda
(
    status BOOLEAN DEFAULT 1,
    data_venda DATE NOT NULL,
    valor_total INTEGER NOT NULL,
    produtoid VARCHAR(30),
    clienteid VARCHAR(14),
    funcionarioid VARCHAR(30),
    PRIMARY KEY (produtoid, clienteid, funcionarioid),
    FOREIGN KEY (produtoid) REFERENCES produto(sku),
    FOREIGN KEY (clienteid) REFERENCES clientes(cpf),
    FOREIGN KEY (funcionarioid) REFERENCES funcionario(matricula)

);

CREATE TABLE envio
(
    sku VARCHAR(33) PRIMARY KEY,
    data_envio DATE NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero VARCHAR(30) NOT NULL,
    funcionarioid VARCHAR(30),
    FOREIGN KEY (funcionarioid) REFERENCES funcionario(matricula)
);

INSERT INTO categorias (id, nome) VALUES
        ('C001', 'Eletrônicos'),
        ('C002', 'Vestuário'),
        ('C003', 'Alimentos'),
        ('C004', 'Bebidas'),
        ('C005', 'Higiene Pessoal'),
        ('C006', 'Livros'),
        ('C007', 'Brinquedos'),
        ('C008', 'Esportes'),
        ('C009', 'Móveis'),
        ('C010', 'Ferramentas'),
        ('C011', 'Informática'),
        ('C012', 'Automóveis'),
        ('C013', 'Beleza'),
        ('C014', 'Jardinagem'),
        ('C015', 'Papelaria');

INSERT INTO produto (sku, descricao, nome, quantidade, cateogirasid) VALUES
        ('P001', 'Celular Android com 128GB', 'Celular Samsung', 50, 'C001'),
        ('P002', 'Camiseta de algodão preta', 'Camiseta Preta', 200, 'C002'),
        ('P003', 'Pacote de arroz 1kg', 'Arroz Branco', 150, 'C003'),
        ('P004', 'Refrigerante sabor cola 2L', 'Coca-Cola', 300, 'C004'),
        ('P005', 'Sabonete líquido 200ml', 'Sabonete Dove', 100, 'C005'),
        ('P006', 'Livro de ficção científica', 'Duna', 60, 'C006'),
        ('P007', 'Boneca de plástico', 'Boneca Barbie', 40, 'C007'),
        ('P008', 'Bola de futebol', 'Bola Nike', 70, 'C008'),
        ('P009', 'Cadeira de escritório', 'Cadeira Gamer', 25, 'C009'),
        ('P010', 'Chave de fenda', 'Chave Philips', 120, 'C010'),
        ('P011', 'Notebook com 8GB de RAM', 'Notebook Dell', 35, 'C011'),
        ('P012', 'Pneu aro 16', 'Pneu Pirelli', 80, 'C012'),
        ('P013', 'Esmalte vermelho 10ml', 'Esmalte Risqué', 90, 'C013'),
        ('P014', 'Semente de girassol 100g', 'Semente Girassol', 50, 'C014'),
        ('P015', 'Caderno 200 folhas', 'Caderno Tilibra', 300, 'C015');

INSERT INTO clientes (cpf, rua, numero, telefone, email) VALUES
         ('11122233344', 'Rua A', '123', '(51) 99999-1111', 'cliente1@email.com'),
         ('55566677788', 'Rua B', '456', '(51) 99999-2222', 'cliente2@email.com'),
         ('99988877766', 'Rua C', '789', '(51) 99999-3333', 'cliente3@email.com'),
         ('11199988877', 'Rua D', '321', '(51) 99999-4444', 'cliente4@email.com'),
         ('22244466688', 'Rua E', '654', '(51) 99999-5555', 'cliente5@email.com'),
         ('33355577799', 'Rua F', '987', '(51) 99999-6666', 'cliente6@email.com'),
         ('44488822211', 'Rua G', '111', '(51) 99999-7777', 'cliente7@email.com'),
         ('55511133322', 'Rua H', '222', '(51) 99999-8888', 'cliente8@email.com'),
         ('66644455533', 'Rua I', '333', '(51) 99999-9999', 'cliente9@email.com'),
         ('77722299944', 'Rua J', '444', '(51) 99999-1010', 'cliente10@email.com'),
         ('88833344455', 'Rua K', '555', '(51) 99999-2020', 'cliente11@email.com'),
         ('99955511166', 'Rua L', '666', '(51) 99999-3030', 'cliente12@email.com'),
         ('11144477777', 'Rua M', '777', '(51) 99999-4040', 'cliente13@email.com'),
         ('22255588888', 'Rua N', '888', '(51) 99999-5050', 'cliente14@email.com'),
         ('33366699999', 'Rua O', '999', '(51) 99999-6060', 'cliente15@email.com');

INSERT INTO funcionario (matricula, nome_completo) VALUES
        ('F001', 'João da Silva'),
        ('F002', 'Maria Oliveira'),
        ('F003', 'Carlos Souza'),
        ('F004', 'Fernanda Lima'),
        ('F005', 'Roberto Gonçalves'),
        ('F006', 'Juliana Mendes'),
        ('F007', 'Luís Cardoso'),
        ('F008', 'Ana Paula'),
        ('F009', 'Paulo Henrique'),
        ('F010', 'Camila Ferreira'),
        ('F011', 'Pedro Santos'),
        ('F012', 'Larissa Batista'),
        ('F013', 'Renato Silva'),
        ('F014', 'André Pereira'),
        ('F015', 'Cláudia Costa');

INSERT INTO venda (status, data_venda, valor_total, produtoid, clienteid, funcionarioid) VALUES
        (1, '2024-01-01', 500, 'P001', '11122233344', 'F001'),
        (0, '2024-02-01', 200, 'P002', '55566677788', 'F002'),
        (1, '2024-03-01', 150, 'P003', '99988877766', 'F003'),
        (1, '2024-04-01', 300, 'P004', '11199988877', 'F004'),
        (0, '2024-05-01', 100, 'P005', '22244466688', 'F005'),
        (1, '2024-06-01', 60, 'P006', '33355577799', 'F006'),
        (0, '2024-07-01', 40, 'P007', '44488822211', 'F007'),
        (1, '2024-08-01', 70, 'P008', '55511133322', 'F008'),
        (0, '2024-09-01', 25, 'P009', '66644455533', 'F009'),
        (1, '2024-10-01', 120, 'P010', '77722299944', 'F010'),
        (0, '2024-11-01', 35, 'P011', '88833344455', 'F011'),
        (1, '2024-12-01', 80, 'P012', '99955511166', 'F012'),
        (0, '2025-01-01', 90, 'P013', '11144477777', 'F013'),
        (1, '2025-02-01', 50, 'P014', '22255588888', 'F014'),
        (0, '2025-03-01', 300, 'P015', '33366699999', 'F015');

INSERT INTO envio (sku, data_envio, rua, numero, funcionarioid) VALUES
        ('P001', '2024-01-01', 'Rua A', '123', 'F001'),
        ('P002', '2024-02-01', 'Rua B', '456', 'F002'),
        ('P003', '2024-03-01', 'Rua C', '789', 'F003'),
        ('P004', '2024-04-01', 'Rua D', '321', 'F004'),
        ('P005', '2024-05-01', 'Rua E', '654', 'F005'),
        ('P006', '2024-06-01', 'Rua F', '987', 'F006'),
        ('P007', '2024-07-01', 'Rua G', '111', 'F007'),
        ('P008', '2024-08-01', 'Rua H', '222', 'F008'),
        ('P009', '2024-09-01', 'Rua I', '333', 'F009'),
        ('P010', '2024-10-01', 'Rua J', '444', 'F010'),
        ('P011', '2024-11-01', 'Rua K', '555', 'F011'),
        ('P012', '2024-12-01', 'Rua L', '666', 'F012'),
        ('P013', '2025-01-01', 'Rua M', '777', 'F013'),
        ('P014', '2025-02-01', 'Rua N', '888', 'F014'),
        ('P015', '2025-03-01', 'Rua O', '999', 'F015');

SELECT *
FROM categorias;

SELECT *
FROM produto;

SELECT *
FROM clientes;

SELECT *
FROM funcionario;

SELECT *
FROM venda;

SELECT *
FROM envio;

ALTER TABLE clientes ADD nome_completo VARCHAR(30);