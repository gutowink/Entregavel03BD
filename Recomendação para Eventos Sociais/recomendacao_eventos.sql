CREATE TABLE usuario
(
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero VARCHAR(30) NOT NULL,
    data_nascimento DATE NOT NULL
);

CREATE TABLE administrador
(
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(30) NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero VARCHAR(30) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(60) NOT NULL,
    senha VARCHAR(40) NOT NULL
);

CREATE TABLE evento
(
    id VARCHAR(15) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    data DATE NOT NULL,
    usuarioid VARCHAR(14),
    administradorid VARCHAR(14),
    FOREIGN KEY (usuarioid) REFERENCES usuario(cpf),
    FOREIGN KEY (administradorid) REFERENCES administrador(cpf)
);

CREATE TABLE mensagem
(
    id VARCHAR(15) PRIMARY KEY,
    data_envio DATE NOT NULL,
    usuarioid VARCHAR(14),
    FOREIGN KEY (usuarioid) REFERENCES usuario(cpf)
);

CREATE TABLE categoria
(
    id VARCHAR(15) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL
);

CREATE TABLE interesse
(
    usuarioid VARCHAR(14),
    categoriaid VARCHAR(15),
    FOREIGN KEY (categoriaid) REFERENCES categoria(id),
    FOREIGN KEY (usuarioid) REFERENCES usuario(cpf)
);

CREATE TABLE participa
(
    status VARCHAR(20),
    usuarioid VARCHAR(14),
    eventoid VARCHAR(15),
    FOREIGN KEY (eventoid) REFERENCES  evento(id),
    FOREIGN KEY (usuarioid) REFERENCES usuario(cpf)
);

CREATE TABLE classificacao
(
    categoriaid VARCHAR(15),
    eventoid VARCHAR(15),
    FOREIGN KEY (categoriaid) REFERENCES categoria(id),
    FOREIGN KEY (eventoid) REFERENCES  evento(id)
);

CREATE TABLE localizacao
(
    id VARCHAR(15) PRIMARY KEY,
    cidade VARCHAR(30) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    latitude VARCHAR(30),
    longitude VARCHAR(30),
    eventoid VARCHAR(15),
    FOREIGN KEY (eventoid) REFERENCES  evento(id)

);

INSERT INTO usuario (cpf, nome, sobrenome, rua, numero, data_nascimento) VALUES
        ('111.111.111-11', 'Carlos', 'Silva', 'Rua A', '123', '1990-01-01'),
        ('222.222.222-22', 'Ana', 'Souza', 'Rua B', '456', '1985-02-10'),
        ('333.333.333-33', 'Paulo', 'Oliveira', 'Rua C', '789', '1992-03-15'),
        ('444.444.444-44', 'Mariana', 'Santos', 'Rua D', '101', '1995-04-20'),
        ('555.555.555-55', 'Rafael', 'Gomes', 'Rua E', '202', '1980-05-30'),
        ('666.666.666-66', 'Fernanda', 'Lima', 'Rua F', '303', '1987-06-25'),
        ('777.777.777-77', 'Lucas', 'Almeida', 'Rua G', '404', '1993-07-07'),
        ('888.888.888-88', 'Bianca', 'Pereira', 'Rua H', '505', '1999-08-11'),
        ('999.999.999-99', 'Thiago', 'Fernandes', 'Rua I', '606', '1981-09-23'),
        ('123.123.123-12', 'Júlia', 'Melo', 'Rua J', '707', '2000-10-15'),
        ('321.321.321-32', 'Gabriel', 'Castro', 'Rua K', '808', '1994-11-05'),
        ('456.456.456-45', 'Clara', 'Nogueira', 'Rua L', '909', '1986-12-01'),
        ('654.654.654-65', 'Pedro', 'Ribeiro', 'Rua M', '1001', '1997-01-20'),
        ('789.789.789-78', 'Marcelo', 'Carvalho', 'Rua N', '1111', '1989-02-28'),
        ('987.987.987-98', 'Isabela', 'Martins', 'Rua O', '1212', '1991-03-03');

INSERT INTO administrador (cpf, nome, sobrenome, rua, numero, telefone, email, senha) VALUES
        ('999.999.999-99', 'Marcos', 'Santos', 'Rua P', '1313', '(11) 99999-1111', 'marcos@admin.com', 'senha123'),
        ('888.888.888-88', 'Roberta', 'Silva', 'Rua Q', '1414', '(11) 99999-2222', 'roberta@admin.com', 'senha456'),
        ('777.777.777-77', 'Luís', 'Ferreira', 'Rua R', '1515', '(11) 99999-3333', 'luis@admin.com', 'senha789'),
        ('666.666.666-66', 'Paula', 'Costa', 'Rua S', '1616', '(11) 99999-4444', 'paula@admin.com', 'senha012'),
        ('555.555.555-55', 'Bruno', 'Mendes', 'Rua T', '1717', '(11) 99999-5555', 'bruno@admin.com', 'senha345'),
        ('444.444.444-44', 'Luciana', 'Oliveira', 'Rua U', '1818', '(11) 99999-6666', 'luciana@admin.com', 'senha678'),
        ('333.333.333-33', 'Fernanda', 'Pereira', 'Rua V', '1919', '(11) 99999-7777', 'fernanda@admin.com', 'senha901'),
        ('222.222.222-22', 'Gustavo', 'Almeida', 'Rua W', '2020', '(11) 99999-8888', 'gustavo@admin.com', 'senha234'),
        ('111.111.111-11', 'Camila', 'Gomes', 'Rua X', '2121', '(11) 99999-9999', 'camila@admin.com', 'senha567'),
        ('101.101.101-10', 'Rafael', 'Lima', 'Rua Y', '2222', '(11) 99999-0000', 'rafael@admin.com', 'senha890'),
        ('202.202.202-20', 'Cláudia', 'Melo', 'Rua Z', '2323', '(11) 99999-1110', 'claudia@admin.com', 'senha1234'),
        ('303.303.303-30', 'Igor', 'Martins', 'Rua AA', '2424', '(11) 99999-2220', 'igor@admin.com', 'senha4567'),
        ('404.404.404-40', 'Juliana', 'Souza', 'Rua BB', '2525', '(11) 99999-3330', 'juliana@admin.com', 'senha7890'),
        ('505.505.505-50', 'Mateus', 'Ribeiro', 'Rua CC', '2626', '(11) 99999-4440', 'mateus@admin.com', 'senha0123'),
        ('606.606.606-60', 'Larissa', 'Fernandes', 'Rua DD', '2727', '(11) 99999-5550', 'larissa@admin.com', 'senha3456');

INSERT INTO categoria (id, nome) VALUES
        ('CAT001', 'Tecnologia'),
        ('CAT002', 'Marketing'),
        ('CAT003', 'Finanças'),
        ('CAT004', 'Educação'),
        ('CAT005', 'Saúde'),
        ('CAT006', 'Esportes'),
        ('CAT007', 'Entretenimento'),
        ('CAT008', 'Inovação'),
        ('CAT009', 'Sustentabilidade'),
        ('CAT010', 'Turismo'),
        ('CAT011', 'Moda'),
        ('CAT012', 'Arte'),
        ('CAT013', 'Engenharia'),
        ('CAT014', 'Agronegócio'),
        ('CAT015', 'Gastronomia');

INSERT INTO participa (status, usuarioid, eventoid) VALUES
        ('confirmado', '111.111.111-11', 'EV001'),
        ('confirmado', '222.222.222-22', 'EV002'),
        ('pendente', '333.333.333-33', 'EV003'),
        ('confirmado', '444.444.444-44', 'EV004'),
        ('pendente', '555.555.555-55', 'EV005'),
        ('confirmado', '666.666.666-66', 'EV006'),
        ('cancelado', '777.777.777-77', 'EV007'),
        ('confirmado', '888.888.888-88', 'EV008'),
        ('pendente', '999.999.999-99', 'EV009'),
        ('confirmado', '123.123.123-12', 'EV010'),
        ('cancelado', '321.321.321-32', 'EV011'),
        ('confirmado', '456.456.456-45', 'EV012'),
        ('pendente', '654.654.654-65', 'EV013'),
        ('confirmado', '789.789.789-78', 'EV014'),
        ('confirmado', '987.987.987-98', 'EV015');

INSERT INTO classificacao (categoriaid, eventoid) VALUES
        ('CAT001', 'EV001'),
        ('CAT002', 'EV002'),
        ('CAT003', 'EV003'),
        ('CAT004', 'EV004'),
        ('CAT005', 'EV005'),
        ('CAT006', 'EV006'),
        ('CAT007', 'EV007'),
        ('CAT008', 'EV008'),
        ('CAT009', 'EV009'),
        ('CAT010', 'EV010'),
        ('CAT011', 'EV011'),
        ('CAT012', 'EV012'),
        ('CAT013', 'EV013'),
        ('CAT014', 'EV014'),
        ('CAT015', 'EV015');

INSERT INTO localizacao (id, cidade, estado, latitude, longitude, eventoid) VALUES
        ('LOC001', 'São Paulo', 'SP', '-23.5505', '-46.6333', 'EV001'),
        ('LOC002', 'Rio de Janeiro', 'RJ', '-22.9068', '-43.1729', 'EV002'),
        ('LOC003', 'Belo Horizonte', 'MG', '-19.9167', '-43.9345', 'EV003'),
        ('LOC004', 'Curitiba', 'PR', '-25.4284', '-49.2733', 'EV004'),
        ('LOC005', 'Porto Alegre', 'RS', '-30.0346', '-51.2177', 'EV005'),
        ('LOC006', 'Florianópolis', 'SC', '-27.5954', '-48.5480', 'EV006'),
        ('LOC007', 'Salvador', 'BA', '-12.9714', '-38.5014', 'EV007'),
        ('LOC008', 'Fortaleza', 'CE', '-3.7172', '-38.5434', 'EV008'),
        ('LOC009', 'Recife', 'PE', '-8.0476', '-34.8770', 'EV009'),
        ('LOC010', 'Brasília', 'DF', '-15.7942', '-47.8822', 'EV010'),
        ('LOC011', 'Manaus', 'AM', '-3.1190', '-60.0217', 'EV011'),
        ('LOC012', 'Goiânia', 'GO', '-16.6869', '-49.2648', 'EV012'),
        ('LOC013', 'Vitória', 'ES', '-20.3155', '-40.3128', 'EV013'),
        ('LOC014', 'Natal', 'RN', '-5.7945', '-35.2110', 'EV014'),
        ('LOC015', 'Campo Grande', 'MS', '-20.4697', '-54.6201', 'EV015');
