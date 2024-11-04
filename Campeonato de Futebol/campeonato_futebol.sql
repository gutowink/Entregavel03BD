CREATE TABLE jogador
(
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    posicao VARCHAR(20) NOT NULL
);

CREATE TABLE equipe
(
    id VARCHAR(26) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero VARCHAR(30) NOT NULL,
    jogadorid VARCHAR(14),
    FOREIGN KEY (jogadorid) REFERENCES jogador(cpf)
);

CREATE TABLE partida
(
    id VARCHAR(26) PRIMARY KEY,
    turno VARCHAR(1) NOT NULL,
    data DATE NOT NULL,
    cartoes VARCHAR(30) NOT NULL,
    gols INTEGER NOT NULL,
    estadio VARCHAR(30) NOT NULL
);

CREATE TABLE participa
(
    partidaid VARCHAR(26),
    equipeid VARCHAR(26),
    PRIMARY KEY (partidaid, equipeid),
    FOREIGN KEY (partidaid) REFERENCES partida(id),
    FOREIGN KEY (equipeid) REFERENCES equipe(id)
);

CREATE TABLE joga
(
    num_jogadores INTEGER NOT NULL,
    partidaid VARCHAR(26),
    jogadorid VARCHAR(14),
    PRIMARY KEY (partidaid, jogadorid),
    FOREIGN KEY (jogadorid) REFERENCES jogador(cpf),
    FOREIGN KEY (partidaid) REFERENCES partida(id)
);

INSERT INTO jogador (cpf, nome, sobrenome, posicao) VALUES
        ('111.111.111-11', 'João', 'Silva', 'Atacante'),
        ('222.222.222-22', 'Carlos', 'Souza', 'Goleiro'),
        ('333.333.333-33', 'Roberto', 'Oliveira', 'Meio-campista'),
        ('444.444.444-44', 'Paulo', 'Pereira', 'Zagueiro'),
        ('555.555.555-55', 'Ricardo', 'Mendes', 'Atacante'),
        ('666.666.666-66', 'Fernando', 'Costa', 'Lateral'),
        ('777.777.777-77', 'André', 'Santos', 'Volante'),
        ('888.888.888-88', 'Lucas', 'Ribeiro', 'Meio-campista'),
        ('999.999.999-99', 'Marcelo', 'Carvalho', 'Zagueiro'),
        ('123.456.789-00', 'Diego', 'Martins', 'Atacante'),
        ('234.567.890-01', 'Thiago', 'Barbosa', 'Lateral'),
        ('345.678.901-02', 'Bruno', 'Lima', 'Atacante'),
        ('456.789.012-03', 'Alex', 'Rocha', 'Meio-campista'),
        ('567.890.123-04', 'José', 'Ferreira', 'Goleiro'),
        ('678.901.234-05', 'Pedro', 'Almeida', 'Zagueiro');

INSERT INTO equipe (id, nome, rua, numero, jogadorid) VALUES
        ('E001', 'Time A', 'Rua 1', '100', '111.111.111-11'),
        ('E002', 'Time B', 'Rua 2', '200', '222.222.222-22'),
        ('E003', 'Time C', 'Rua 3', '300', '333.333.333-33'),
        ('E004', 'Time D', 'Rua 4', '400', '444.444.444-44'),
        ('E005', 'Time E', 'Rua 5', '500', '555.555.555-55'),
        ('E006', 'Time F', 'Rua 6', '600', '666.666.666-66'),
        ('E007', 'Time G', 'Rua 7', '700', '777.777.777-77'),
        ('E008', 'Time H', 'Rua 8', '800', '888.888.888-88'),
        ('E009', 'Time I', 'Rua 9', '900', '999.999.999-99'),
        ('E010', 'Time J', 'Rua 10', '1000', '123.456.789-00'),
        ('E011', 'Time K', 'Rua 11', '1100', '234.567.890-01'),
        ('E012', 'Time L', 'Rua 12', '1200', '345.678.901-02'),
        ('E013', 'Time M', 'Rua 13', '1300', '456.789.012-03'),
        ('E014', 'Time N', 'Rua 14', '1400', '567.890.123-04'),
        ('E015', 'Time O', 'Rua 15', '1500', '678.901.234-05');

INSERT INTO partida (id, turno, data, cartoes, gols, estadio) VALUES
        ('P001', 'M', '2024-09-01', '2 amarelo 1 vermelho', 3, 'Estádio A'),
        ('P002', 'T', '2024-09-02', '1 amarelo 0 vermelho', 2, 'Estádio B'),
        ('P003', 'N', '2024-09-03', '3 amarelo 1 vermelho', 4, 'Estádio C'),
        ('P004', 'M', '2024-09-04', '0 amarelo 0 vermelho', 1, 'Estádio D'),
        ('P005', 'T', '2024-09-05', '2 amarelo 1 vermelho', 3, 'Estádio E'),
        ('P006', 'N', '2024-09-06', '1 amarelo 1 vermelho', 2, 'Estádio F'),
        ('P007', 'M', '2024-09-07', '3 amarelo 2 vermelho', 4, 'Estádio G'),
        ('P008', 'T', '2024-09-08', '2 amarelo 0 vermelho', 3, 'Estádio H'),
        ('P009', 'N', '2024-09-09', '1 amarelo 0 vermelho', 2, 'Estádio I'),
        ('P010', 'M', '2024-09-10', '4 amarelo 2 vermelho', 5, 'Estádio J'),
        ('P011', 'T', '2024-09-11', '2 amarelo 1 vermelho', 3, 'Estádio K'),
        ('P012', 'N', '2024-09-12', '1 amarelo 0 vermelho', 2, 'Estádio L'),
        ('P013', 'M', '2024-09-13', '3 amarelo 1 vermelho', 4, 'Estádio M'),
        ('P014', 'T', '2024-09-14', '2 amarelo 1 vermelho', 3, 'Estádio N'),
        ('P015', 'N', '2024-09-15', '1 amarelo 0 vermelho', 2, 'Estádio O');

INSERT INTO participa (partidaid, equipeid) VALUES
        ('P001', 'E001'),
        ('P002', 'E002'),
        ('P003', 'E003'),
        ('P004', 'E004'),
        ('P005', 'E005'),
        ('P006', 'E006'),
        ('P007', 'E007'),
        ('P008', 'E008'),
        ('P009', 'E009'),
        ('P010', 'E010'),
        ('P011', 'E011'),
        ('P012', 'E012'),
        ('P013', 'E013'),
        ('P014', 'E014'),
        ('P015', 'E015');

INSERT INTO joga (num_jogadores, partidaid, jogadorid) VALUES
        (11, 'P001', '111.111.111-11'),
        (11, 'P002', '222.222.222-22'),
        (11, 'P003', '333.333.333-33'),
        (11, 'P004', '444.444.444-44'),
        (11, 'P005', '555.555.555-55'),
        (11, 'P006', '666.666.666-66'),
        (11, 'P007', '777.777.777-77'),
        (11, 'P008', '888.888.888-88'),
        (11, 'P009', '999.999.999-99'),
        (11, 'P010', '123.456.789-00'),
        (11, 'P011', '234.567.890-01'),
        (11, 'P012', '345.678.901-02'),
        (11, 'P013', '456.789.012-03'),
        (11, 'P014', '567.890.123-04'),
        (11, 'P015', '678.901.234-05');

SELECT *
FROM jogador;

SELECT *
FROM equipe;

SELECT *
FROM partida;

SELECT *
FROM participa;

SELECT *
FROM joga;

