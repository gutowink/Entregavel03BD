CREATE TABLE estoque
(
    codigo VARCHAR(30) PRIMARY KEY,
    cds INTEGER NOT NULL,
    vinil INTEGER NOT NULL,
    fitas INTEGER NOT NULL
);

CREATE TABLE cliente
(
    cpf VARCHAR(14) PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    telefone VARCHAR(40) NOT NULL
);

CREATE TABLE turnes
(
    id VARCHAR(26) PRIMARY KEY,
    cidade VARCHAR(33) NOT NULL,
    banda VARCHAR(30) NOT NULL,
    data_show DATE NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero VARCHAR(3) NOT NULL
);

CREATE TABLE avaliacao
(
    opiniao TEXT NOT NULL,
    data DATE NOT NULL,
    estoqueid VARCHAR(30),
    clienteid VARCHAR(14),
    turnesid VARCHAR(26),
    PRIMARY KEY (estoqueid, clienteid, turnesid),
    FOREIGN KEY (estoqueid) REFERENCES estoque(codigo),
    FOREIGN KEY (clienteid) REFERENCES cliente(cpf),
    FOREIGN KEY (turnesid) REFERENCES turnes(id)
);

INSERT INTO estoque (codigo, cds, vinil, fitas) VALUES
        ('E001', 100, 50, 30),
        ('E002', 120, 60, 40),
        ('E003', 150, 70, 45),
        ('E004', 110, 65, 35),
        ('E005', 130, 55, 25),
        ('E006', 140, 75, 50),
        ('E007', 125, 80, 55),
        ('E008', 160, 90, 60),
        ('E009', 170, 85, 65),
        ('E010', 135, 95, 70),
        ('E011', 145, 100, 75),
        ('E012', 155, 105, 80),
        ('E013', 165, 110, 85),
        ('E014', 175, 115, 90),
        ('E015', 185, 120, 95);

INSERT INTO cliente (cpf, email, nome, sobrenome, telefone) VALUES
        ('111.111.111-11', 'joao@gmail.com', 'João', 'Silva', '99999-1111'),
        ('222.222.222-22', 'maria@gmail.com', 'Maria', 'Oliveira', '99999-2222'),
        ('333.333.333-33', 'jose@gmail.com', 'José', 'Santos', '99999-3333'),
        ('444.444.444-44', 'ana@gmail.com', 'Ana', 'Pereira', '99999-4444'),
        ('555.555.555-55', 'carlos@gmail.com', 'Carlos', 'Costa', '99999-5555'),
        ('666.666.666-66', 'paula@gmail.com', 'Paula', 'Martins', '99999-6666'),
        ('777.777.777-77', 'pedro@gmail.com', 'Pedro', 'Rocha', '99999-7777'),
        ('888.888.888-88', 'lucas@gmail.com', 'Lucas', 'Ferreira', '99999-8888'),
        ('999.999.999-99', 'juliana@gmail.com', 'Juliana', 'Carvalho', '99999-9999'),
        ('123.123.123-12', 'fernanda@gmail.com', 'Fernanda', 'Ramos', '99999-1010'),
        ('321.321.321-32', 'gabriel@gmail.com', 'Gabriel', 'Alves', '99999-1111'),
        ('456.456.456-45', 'rafael@gmail.com', 'Rafael', 'Mendes', '99999-1212'),
        ('654.654.654-65', 'sofia@gmail.com', 'Sofia', 'Barbosa', '99999-1313'),
        ('789.789.789-78', 'ricardo@gmail.com', 'Ricardo', 'Lima', '99999-1414'),
        ('987.987.987-98', 'luana@gmail.com', 'Luana', 'Souza', '99999-1515');

INSERT INTO turnes (id, cidade, banda, data_show, rua, numero) VALUES
        ('T001', 'Porto Alegre', 'Banda A', '2024-10-01', 'Rua X', '100'),
        ('T002', 'São Paulo', 'Banda B', '2024-10-05', 'Rua Y', '200'),
        ('T003', 'Rio de Janeiro', 'Banda C', '2024-10-10', 'Rua Z', '300'),
        ('T004', 'Curitiba', 'Banda D', '2024-10-15', 'Rua W', '400'),
        ('T005', 'Belo Horizonte', 'Banda E', '2024-10-20', 'Rua V', '500'),
        ('T006', 'Brasília', 'Banda F', '2024-10-25', 'Rua U', '600'),
        ('T007', 'Salvador', 'Banda G', '2024-10-30', 'Rua T', '700'),
        ('T008', 'Recife', 'Banda H', '2024-11-01', 'Rua S', '800'),
        ('T009', 'Fortaleza', 'Banda I', '2024-11-05', 'Rua R', '900'),
        ('T010', 'Manaus', 'Banda J', '2024-11-10', 'Rua Q', '1000'),
        ('T011', 'Florianópolis', 'Banda K', '2024-11-15', 'Rua P', '1100'),
        ('T012', 'Porto Velho', 'Banda L', '2024-11-20', 'Rua O', '1200'),
        ('T013', 'Natal', 'Banda M', '2024-11-25', 'Rua N', '1300'),
        ('T014', 'João Pessoa', 'Banda N', '2024-12-01', 'Rua M', '1400'),
        ('T015', 'Aracaju', 'Banda O', '2024-12-05', 'Rua L', '1500');

INSERT INTO avaliacao (opiniao, data, estoqueid, clienteid, turnesid) VALUES
        ('Ótima qualidade dos produtos!', '2024-09-01', 'E001', '111.111.111-11', 'T001'),
        ('Muito bom, recomendo!', '2024-09-02', 'E002', '222.222.222-22', 'T002'),
        ('A experiência foi incrível!', '2024-09-03', 'E003', '333.333.333-33', 'T003'),
        ('Produtos excelentes!', '2024-09-04', 'E004', '444.444.444-44', 'T004'),
        ('Tudo chegou no prazo!', '2024-09-05', 'E005', '555.555.555-55', 'T005'),
        ('Bom atendimento e produtos de qualidade!', '2024-09-06', 'E006', '666.666.666-66', 'T006'),
        ('Gostei muito da variedade de produtos!', '2024-09-07', 'E007', '777.777.777-77', 'T007'),
        ('A turnê foi incrível!', '2024-09-08', 'E008', '888.888.888-88', 'T008'),
        ('Voltarei a comprar!', '2024-09-09', 'E009', '999.999.999-99', 'T009'),
        ('Superou minhas expectativas!', '2024-09-10', 'E010', '123.123.123-12', 'T010'),
        ('Produtos bem embalados e entrega rápida!', '2024-09-11', 'E011', '321.321.321-32', 'T011'),
        ('Recomendo os serviços!', '2024-09-12', 'E012', '456.456.456-45', 'T012'),
        ('Show incrível e produtos de qualidade!', '2024-09-13', 'E013', '654.654.654-65', 'T013'),
        ('Tudo correu conforme o esperado!', '2024-09-14', 'E014', '789.789.789-78', 'T014'),
        ('Excelente evento e produtos ótimos!', '2024-09-15', 'E015', '987.987.987-98', 'T015');
