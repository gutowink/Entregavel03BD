CREATE TABLE gestor
(
    codigo VARCHAR(20) PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    departamento VARCHAR(50) NOT NULL
);

CREATE TABLE funcionario
(
    codigo VARCHAR(20) PRIMARY KEY,
    cargo VARCHAR(30) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    nome_completo VARCHAR(100) NOT NULL
);

CREATE TABLE avaliacao
(
    nota INTEGER NOT NULL,
    data_avaliacao DATE NOT NULL,
    gestorid VARCHAR(20),
    funcionarioid VARCHAR(20),
    PRIMARY KEY (gestorid, funcionarioid),
    FOREIGN KEY (gestorid) REFERENCES gestor(codigo),
    FOREIGN KEY (funcionarioid) REFERENCES funcionario(codigo)
);

CREATE TABLE meta
(
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    categorias VARCHAR(50) NOT NULL,
    quantidade INTEGER NOT NULL,
    data_cadastro DATE NOT NULL,
    produto VARCHAR(50),
    funcionarioid VARCHAR(20),
    FOREIGN KEY (funcionarioid) REFERENCES funcionario(codigo)
);

CREATE TABLE venda
(
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    produto VARCHAR(30) NOT NULL,
    data_venda DATE NOT NULL,
    quantidade INTEGER NOT NULL,
    funcionarioid VARCHAR(20),
    FOREIGN KEY (funcionarioid) REFERENCES funcionario(codigo)
);

